package org.boomslang.generator.geb.feature.core

import com.google.inject.Inject
import org.boomslang.dsl.feature.feature.BCommandComponentActionParameter
import org.boomslang.generator.util.BGeneratorUtil
import org.boomslang.dsl.feature.feature.BCommandComponent
import org.boomslang.dsl.feature.feature.BCommandAction
import org.boomslang.dsl.feature.feature.BClickAction
import org.boomslang.dsl.feature.feature.BTypeAction

class BCommandGenerator {
	
	@Inject extension BGeneratorUtil

	// =============================================================================
	// Commands
	// =============================================================================
	def dispatch compile(BCommandComponentActionParameter it) '''
		// TODO
		println "commands of type «it.eClass.name» not yet implemented"
	'''

	def dispatch compile(BCommandComponent it)'''
	«it.widget.widget.name».value «action.compileAction» 
	'''	
	
	def dispatch compileAction(BCommandAction it)'''
	// TODO
	println "command actions of type «it.eClass.name» not yet implemented"
	'''
	
	def dispatch compileAction(BTypeAction it)'''
	«it.value.compileStringOrParam»
	'''		
}