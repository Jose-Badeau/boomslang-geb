package org.boomslang.generator.geb.mapping.core

import org.boomslang.dsl.mapping.mapping.BMapping
import org.boomslang.dsl.mapping.mapping.BMappingPackage
import org.boomslang.dsl.mapping.mapping.BNlsLangDecl
import org.boomslang.dsl.mapping.mapping.BUrl
import org.boomslang.dsl.mapping.mapping.BWidgetMapping
import org.boomslang.dsl.mapping.mapping.LanguageEnum
import org.boomslang.dsl.mapping.mapping.MExpression
import org.boomslang.dsl.mapping.mapping.MNlsMultiLangExpr
import org.boomslang.dsl.mapping.mapping.MStringLiteral
import org.boomslang.generator.interfaces.IBoomAggregateGenerator
import java.util.regex.Pattern
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.xtext.generator.IFileSystemAccess

import static org.boomslang.generator.geb.mapping.ui.GebOutputConfigurationProvider.*
 
import static extension com.google.common.base.Strings.*

class BMappingGenerator implements IBoomAggregateGenerator {

    override doGenerate(Resource resource, IFileSystemAccess fsa) {
        if (resource == null) {
            return
        }
        switch (pack : resource.contents.get(0)) {
            BMappingPackage: {
                pack.getBMapping.generateBMapping(fsa)
            }
        }
    }

    def void generateBMapping(BMapping it, IFileSystemAccess fsa) {
        val screenName = it.screen?.name
        if (screenName == null) {
            return
        }

        val matcher = Pattern.compile('''^(.*)\.(\w+)$''').matcher(screenName)
        if (!matcher.matches) {
            return
        }
        val screenPackage = matcher.group(1)
        val screenSimpleName = matcher.group(2)
        val screenDir = screenPackage.replaceAll('''\.''', "/")

        val effectiveBaseNavigator = if (it.screenNavigator.nullOrEmpty) {
                "org.boomslang.navigators.BoomslangNonEmptyNavigator"
            } else {
                it.screenNavigator
            }

        fsa.generateFile(
            '''«screenDir»/«screenSimpleName»Screen.groovy''',
            OUTPUT_CONFIG_GEB,
            compileBMapping(screenPackage, effectiveBaseNavigator)
        )

    }

    def compileBMapping(BMapping it, String screenPackage, String effectiveBaseNavigator) '''
        package «screenPackage»
        
        class «it.screen?.name?.replaceFirst('''^.*\.(\w+)$''', "$1")»Screen extends org.boomslang.pages.BoomslangScreen {
        
        	static url = "«it.getBUrl.compileMappingUrl»"
        
        	static at = { waitFor { title == "«it.getBLabel.expression.compileExp»" } }
        
        	static content = {
        		«FOR m : it.getBWidgetMapping»
        		    «m.compileBWidgetMapping(effectiveBaseNavigator)»
        		«ENDFOR»
        	}
        
        }
    '''

    def navigatorName(BWidgetMapping it) {
        it.widget.name + "Navigator"
    }

    def compileMappingUrl(BUrl it) '''«getMFragment.compileExp»'''

    def compileBWidgetMapping(BWidgetMapping it, String effectiveBaseNavigator) '''
        «it.widget.name» «compileWidgetMappingNavigatorPart(it, effectiveBaseNavigator)»
    '''

    def compileWidgetMappingNavigatorPart(BWidgetMapping it,
        String effectiveBaseNavigator
    ) '''(required: true , wait:true){module «IF it.widgetNavigator == null»«effectiveBaseNavigator»«ELSE»«it.widgetNavigator»«ENDIF»,$("«it.
			locator.compileExp»)" }
    '''

    def dispatch CharSequence compileExp(Void it) ''''''

    def dispatch CharSequence compileExp(MExpression it) ''''''

    def dispatch CharSequence compileExp(MNlsMultiLangExpr it) {
        it.langDecl.map[compile].join
    }

    def compile(BNlsLangDecl it) {
        if (it.lang == LanguageEnum::EN) {
            it.expression.compileExp
        } else {
            return ""
        }
    }

    def dispatch CharSequence compileExp(MStringLiteral it) {
        return it.value
    }

    override doGenerate(ResourceSet input, IFileSystemAccess fsa) {
        //Not needed
    }

    override getShortDescription() {
        "Mapping Generation"
    }

}
