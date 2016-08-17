package org.boomslang.generator.geb.mapping.core.test

import org.boomslang.dsl.mapping.MappingRuntimeModule
import org.boomslang.generator.geb.mapping.core.BMappingGenerator

class MappingGeneratorRuntimeModule extends MappingRuntimeModule {

	
    def Class<? extends BMappingGenerator> bindBFeatureGenerator() {
        return BMappingGenerator;
    }
}
