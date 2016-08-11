package org.boomslang.generator.geb.feature.core

import com.google.inject.Inject
import org.boomslang.dsl.feature.feature.BAssertionAction
import org.boomslang.dsl.feature.feature.BBooleanAssertionAction
import org.boomslang.dsl.feature.services.WidgetTypeRefUtil
import org.boomslang.generator.util.BGeneratorUtil

class BAssertionGenerator {

	@Inject extension BGeneratorUtil
	
	@Inject extension WidgetTypeRefUtil
	

	// =============================================================================
	// Assertions
	// =============================================================================


	def dispatch compile(BAssertionAction it) '''
	// TODO
	println "Assertions of type «it.eClass.name» not yet implemented"'''

	
	def dispatch compile(BBooleanAssertionAction it) '''
		«IF it.booleanPropertyName == 'visible'»
		waitFor { «it.widgetBeforeOffset.name» }
		«ELSE»
		// property assertion for «it.booleanPropertyName» not yet implemented
		// «it.widgetBeforeOffset.name».«it.booleanPropertyName» == «
			IF booleanPropertyNotTrue»false«ELSE»true«ENDIF»
		«ENDIF»
	'''	
	
}