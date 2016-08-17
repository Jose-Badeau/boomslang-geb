package org.boomslang.generator.geb.feature.core.test

import com.google.inject.Inject
import org.boomslang.dsl.feature.feature.BFeaturePackage
import org.boomslang.generator.geb.feature.core.BFeatureGenerator
import org.eclipse.emf.common.util.URI
import org.eclipse.xtext.generator.InMemoryFileSystemAccess
import org.eclipse.xtext.junit4.AbstractXtextTests
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.resource.XtextResourceSet
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(FeatureInjectorProvider))
class FeatureGeneratorTest extends AbstractXtextTests{
	
	val basePath= 'org/boomslang/testproject/jhipster/'
    val featurePath=basePath+'features/'
    val screenPath=basePath+'screens/'
    val generatedPath=featurePath+'generated/'
    val outputPath="OUTPUT_CONFIG_GEB"+featurePath
	
    @Inject BFeatureGenerator underTest
    @Inject extension ParseHelper<BFeaturePackage> parseHelper 
    
    
	@Inject
	XtextResourceSet xtextResourceSet
	
	
	@Test
    def textInputAndButton() {
		executeTest('Login')
    }
       /**
     * Method that does the actual test
     */
    def executeTest(String screen){
        xtextResourceSet.loadScreen(screen.screenPath)
        val model= (screen.featurePath).readFileIntoString().parse(xtextResourceSet)
        val fsa = new InMemoryFileSystemAccess()
        underTest.doGenerate(model.eResource, fsa)
        assertEquals(1,fsa.allFiles.size)
        assertTrue(fsa.allFiles.containsKey(screen.outputPath))
        assertEquals(screen.generatedPath.readFileIntoString(), fsa.allFiles.get(screen.outputPath).toString)	
    }
    def featurePath (String screenName){
    	featurePath+screenName+".feature"
    }
    
    def screenPath (String screenName){
    	screenPath+screenName+".screen"
    }
    
    def generatedPath(String screenName){
    	generatedPath+screenName+"Feature.groovy"
    }
    
    def outputPath(String screenName){
    	outputPath+screenName+"Feature.groovy"
    }
     
       
     /**
	 * Name with pending .screen
	 */
	def loadScreen(XtextResourceSet xtextResourceSet, String name) {
		xtextResourceSet.getResource(URI.createURI("classpath:/"+name), true).load(null)
	}
        } 