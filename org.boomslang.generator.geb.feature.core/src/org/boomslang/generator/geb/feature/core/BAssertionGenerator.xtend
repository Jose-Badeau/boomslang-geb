package org.boomslang.generator.geb.feature.core

import com.google.inject.Inject
import com.wireframesketcher.model.Widget
import org.boomslang.dsl.feature.feature.BAssertionAction
import org.boomslang.dsl.feature.feature.BAssertionComponent
import org.boomslang.dsl.feature.feature.BAssertionComponentActionParameter
import org.boomslang.dsl.feature.feature.BBooleanAssertionAction
import org.boomslang.dsl.feature.services.WidgetTypeRefUtil
import org.boomslang.generator.util.BGeneratorUtil

class BAssertionGenerator {

	@Inject extension BGeneratorUtil
	
	@Inject extension WidgetTypeRefUtil
	

	// =============================================================================
	// Assertions
	// =============================================================================


	def dispatch compile(BAssertionComponentActionParameter it) '''
	// TODO
	println "Assertions of type «it.eClass.name» not yet implemented"'''
	
	
	def dispatch compile(BAssertionComponent it)'''
	«it.action.compileAction»'''
	
	// =============================================================================
	// Actions
	// =============================================================================
	
	
	def dispatch compileAction(BAssertionAction it)'''
	// TODO
	println "Assertions of type «it.eClass.name» not yet implemented"'''
	
	
	def dispatch compileAction(BBooleanAssertionAction it) '''
		«IF it.booleanPropertyName == 'visible'»
		waitFor { «it.widgetBeforeOffset.name.toFirstLower» }
		«ELSEIF it.booleanPropertyName == 'locked'»
		«it.widgetBeforeOffset.name.toFirstLower».disabled==«IF booleanPropertyNotTrue»false«ELSE»true«ENDIF»
		«ELSE»
		// property assertion for «it.booleanPropertyName» not yet implemented
		«it.widgetBeforeOffset.name.toFirstLower».«it.booleanPropertyName» == «
		IF booleanPropertyNotTrue»false«ELSE»true«ENDIF»
		«ENDIF»
	'''	
}