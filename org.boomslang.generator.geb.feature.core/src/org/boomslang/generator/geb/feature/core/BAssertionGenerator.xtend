package org.boomslang.generator.geb.feature.core

import org.boomslang.dsl.feature.feature.BAssertion
import org.boomslang.dsl.feature.feature.BBooleanPropertyAssertion
import org.boomslang.dsl.feature.feature.BFeature
import org.boomslang.dsl.feature.feature.BScenario
import org.boomslang.dsl.feature.feature.BScreenshotAssertion
import org.boomslang.dsl.feature.feature.BTableRowColAssertion
import org.boomslang.dsl.feature.feature.BTextContainsAsssertion
import org.boomslang.dsl.feature.feature.TagModeEnum
import com.google.inject.Inject

import static extension org.eclipse.xtext.EcoreUtil2.*
import org.boomslang.generator.util.BGeneratorUtil

class BAssertionGenerator {

	@Inject extension BGeneratorUtil

	// =============================================================================
	// Assertions
	// =============================================================================


	def dispatch compile(BAssertion it) '''
	// TODO
	println "Assertions of type «it.eClass.name» not yet implemented"'''

	
	def dispatch compile(BScreenshotAssertion it) '''
		looksLike«IF it.isIncludeFilter»Including«ELSE»Excluding«ENDIF»("«id»", [«
			
			FOR widgetWrapper: it.bwidgetWrapperList.bwidgetWrappers SEPARATOR ", "»«
				widgetWrapper.widget.name»«
			ENDFOR
			
			»], «IF effectiveTagScreenMode»true«ELSE»false«ENDIF»)
	'''

	def dispatch compile(BBooleanPropertyAssertion it) '''
		«IF it.booleanPropertyName == 'visible'»
		waitFor { «it.assertionWidgetWrapper.widget.name» }
		«ELSE»
		// property assertion for «it.booleanPropertyName» not yet implemented
		// «it.assertionWidgetWrapper.widget.name».«it.booleanPropertyName» == «
			IF booleanPropertyNotTrue»false«ELSE»true«ENDIF»
		«ENDIF»
	'''	
	
	//assertionWidgetWrapper=BWidgetWrapper propertyName=ID 'is' equals=Word
	
	
	def dispatch compile(BTextContainsAsssertion it) '''
		waitFor { «it.assertionWidgetWrapper.widget.name» }
		«it.assertionWidgetWrapper.widget.name».text().contains(«it.contains.compileStringOrParam»)
	'''
	
	def dispatch compile(BTableRowColAssertion it) '''
		waitFor { «it.table.table.name» }
		«it.table.table.name».cellValue(«it.row», «it.col») == «it.cellValue.compileStringOrParam»
	'''


	// =============================================================================
	// Utility methods
	// =============================================================================
	
	/**
	 * @return the effective tagscreen mode for a given screenshot asseration,
	 * computed by checking the feature tagscreen mode which may be overridden
	 * by the screenshot assertion tagscreen mode.
	 * The default tag screen mode is false. 
	 */
	def boolean effectiveTagScreenMode(BScreenshotAssertion it) {
		val feature = it.getContainerOfType(BFeature)
		val scenario = it.getContainerOfType(BScenario)
		
		val global = switch (feature.tagScreenMode) {
			case TagModeEnum::TRUE : true
			default : false
		}
		switch (scenario.tagScreenMode) {
			case TagModeEnum::UNSPECIFIED : return global
			case TagModeEnum::FALSE : return false
			case TagModeEnum::TRUE : return true
		}
		// should return before this statement
		throw new Exception('could not compute effectiveTagScreenMode')
	}

	
}