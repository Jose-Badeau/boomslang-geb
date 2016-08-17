package org.boomslang.generator.geb.feature.core

import com.google.inject.Inject
import org.boomslang.dsl.feature.feature.BCommandAction
import org.boomslang.dsl.feature.feature.BCommandComponent
import org.boomslang.dsl.feature.feature.BCommandComponentActionParameter
import org.boomslang.dsl.feature.feature.BTypeAction
import org.boomslang.dsl.feature.services.WidgetTypeRefUtil
import org.boomslang.generator.util.BGeneratorUtil
import org.boomslang.dsl.feature.feature.BClickAction

class BCommandGenerator {
		
	@Inject extension WidgetTypeRefUtil 
	@Inject extension BGeneratorUtil

	// =============================================================================
	// Commands
	// =============================================================================
	def dispatch compile(BCommandComponentActionParameter it) '''
		// TODO
		println "commands of type «it.eClass.name» not yet implemented"
	'''
	
	// =============================================================================
	// Command Componens
	// =============================================================================
	def dispatch compile(BCommandComponent it)'''
	«it.action.compileAction»'''	
	
	// =============================================================================
	// Actions
	// =============================================================================
	def dispatch compileAction(BCommandAction it)'''
	// TODO
	println "command actions of type «it.eClass.name» not yet implemented"
	'''
	
	def dispatch compileAction(BTypeAction it)'''
	«it.widgetBeforeOffset.name».value $«it.widgetBeforeOffset.name.toFirstLower»'''
	
	def dispatch compileAction(BClickAction it)'''
	«it.widgetBeforeOffset.name».click()
	'''
	
	// =============================================================================
	// Action Parameter
	// =============================================================================
	def dispatch compileActionParameter(BCommandAction it)'''
	// TODO
	println "command actions of type «it.eClass.name» not yet implemented"
	'''
	def dispatch compileActionParameter(BTypeAction it)'''
		«it.value.compileStringOrParam»'''
	
}