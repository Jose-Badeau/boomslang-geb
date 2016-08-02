package org.boomslang.generator.mapping.ui

import org.eclipse.xtext.generator.OutputConfigurationProvider
import org.eclipse.xtext.generator.OutputConfiguration

/**
 * Define output configurations, specifying for example the output directory (or output directories) of the generator.
 * The generator may use multiple output configurations.
 * 
 */
class GebOutputConfigurationProvider extends OutputConfigurationProvider {
    
    public static val String OUTPUT_CONFIG_GEB = "OUTPUT_CONFIG_GEB";
    
    public static val String OUTPUT_CONFIG_GEB_DIR = "src/main/groovy/gen"
 
    /**
     * @return a list of custom output configurations with specific options
     * for each output configuration (e.g. directory name, whether the directory should
     * be cleaned on build, whether generated files should be marked as derived, etc.)
     */
    override public getOutputConfigurations() {
        val configurations = // super.outputConfigurations // in case existing configurations are needed
        <OutputConfiguration>newHashSet
        configurations += new OutputConfiguration(OUTPUT_CONFIG_GEB) => [
            description = "Output folder for Boomslang test files"
            outputDirectory = "./" + OUTPUT_CONFIG_GEB_DIR
            overrideExistingResources = true
            createOutputDirectory = true
            cleanUpDerivedResources = true
            setDerivedProperty = true
        ]
        return configurations
    }
    
}