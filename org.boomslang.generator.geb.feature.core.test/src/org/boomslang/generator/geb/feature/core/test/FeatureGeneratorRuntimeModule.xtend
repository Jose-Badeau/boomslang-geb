package org.boomslang.generator.geb.feature.core.test

import org.boomslang.dsl.feature.FeatureRuntimeModule
import org.boomslang.generator.geb.feature.core.BFeatureGenerator

class FeatureGeneratorRuntimeModule extends FeatureRuntimeModule {

	
    def Class<? extends BFeatureGenerator> bindBFeatureGenerator() {
        return BFeatureGenerator;
    }
}