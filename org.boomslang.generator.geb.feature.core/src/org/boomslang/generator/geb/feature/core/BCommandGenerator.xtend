package org.boomslang.generator.geb.feature.core

import org.boomslang.dsl.feature.feature.BClickCommand
import org.boomslang.dsl.feature.feature.BCommand
import org.boomslang.dsl.feature.feature.BListSelectValuesCommand
import org.boomslang.dsl.feature.feature.BTypeCommand
import com.google.inject.Inject
import org.boomslang.generator.util.BGeneratorUtil

class BCommandGenerator {
	
	@Inject extension BGeneratorUtil

	// =============================================================================
	// Commands
	// =============================================================================
	def dispatch compile(BCommand it) '''
		// TODO
		println "commands of type «it.eClass.name» not yet implemented"
	'''

	def dispatch compile(BTypeCommand it) '''
		waitFor { «it.textInputSupport.name» }
		«it.textInputSupport.name» = «stringOrParam.compileStringOrParam»
	'''

	def dispatch compile(BClickCommand it) '''
		waitFor { «it.clickSupport.name» }
		«it.clickSupport.name».click()
	'''

	def dispatch compile(BListSelectValuesCommand it) {
		it.listWrapper.list
		
		if (it.values.size == 1) {
			'''
				waitFor { «it.listWrapper.list.name» }
				«it.listWrapper.list.name» = «it.values.head.compileStringOrParam»
			'''
		} else {
			'''// list selection with multiple selections not yet implemented'''
		}
	}
	

	
}