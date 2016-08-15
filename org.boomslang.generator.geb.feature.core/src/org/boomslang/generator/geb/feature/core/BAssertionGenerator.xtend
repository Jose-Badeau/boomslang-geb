package org.boomslang.generator.geb.feature.core

import com.google.inject.Inject
import org.boomslang.dsl.feature.feature.BAssertionComponentActionParameter
import org.boomslang.dsl.feature.feature.BBooleanAssertionAction
import org.boomslang.dsl.feature.services.WidgetTypeRefUtil
import org.boomslang.generator.util.BGeneratorUtil
import org.boomslang.dsl.feature.feature.impl.BBooleanAssertionActionImpl

class BAssertionGenerator {

	@Inject extension BGeneratorUtil
	
	@Inject extension WidgetTypeRefUtil
	

	// =============================================================================
	// Assertions
	// =============================================================================


	def dispatch compile(BAssertionComponentActionParameter it) '''
	// TODO
	println "Assertions of type «it.eClass.name» not yet implemented"'''

	
	def dispatch compile(BBooleanAssertionActionImpl it) '''
		«IF it.booleanPropertyName == 'visible'»
		waitFor { «it.widgetBeforeOffset.name» }
		«ELSE»
		// property assertion for «it.booleanPropertyName» not yet implemented
		// «it.widgetBeforeOffset.name».«it.booleanPropertyName» == «
			IF booleanPropertyNotTrue»false«ELSE»true«ENDIF»
		«ENDIF»
	'''	
	
}