package org.boomslang.generator.geb.feature.core

import com.google.inject.Inject
import org.boomslang.dsl.feature.feature.BCommandComponentActionParameter
import org.boomslang.generator.util.BGeneratorUtil

class BCommandGenerator {
	
	@Inject extension BGeneratorUtil

	// =============================================================================
	// Commands
	// =============================================================================
	def dispatch compile(BCommandComponentActionParameter it) '''
		// TODO
		println "commands of type «it.eClass.name» not yet implemented"
	'''

	
	

	
}