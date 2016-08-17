package org.boomslang.generator.geb.mapping.core.test

import com.google.inject.Inject
import org.boomslang.dsl.mapping.mapping.BMappingPackage
import org.boomslang.generator.geb.mapping.core.BMappingGenerator
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
@InjectWith(typeof(MappingInjectorProvider))
class MappingGeneratorTest extends AbstractXtextTests{
	
	
    @Inject BMappingGenerator underTest
    @Inject extension ParseHelper<BMappingPackage> parseHelper 
    
    val basePath= 'org/boomslang/testproject/jhipster/'
    val mappingPath=basePath+'mappings/'
    val screenPath=basePath+'screens/'
    val generatedPath=mappingPath+'generated/'
    val outputPath="OUTPUT_CONFIG_GEB"+screenPath
    
    
	@Inject
	XtextResourceSet xtextResourceSet
	
	
	@Test
    def testTextInputAndButton() {
		executeTest("Login")
    }
       
	@Test
    def testDropdown() {
    	executeTest("Register")
    }
    
    @Test
    def testTable() {
    	executeTest("Books")
    }
    
    /**
     * Method that does the actual test
     */
    def executeTest(String screen){
        xtextResourceSet.loadScreen(screen.screenPath)
        val model= (screen.mappingPath).readFileIntoString().parse(xtextResourceSet)
        val fsa = new InMemoryFileSystemAccess()
        underTest.doGenerate(model.eResource, fsa)
        assertEquals(1,fsa.allFiles.size)
        assertTrue(fsa.allFiles.containsKey(screen.outputPath))
        assertEquals(screen.generatedPath.readFileIntoString(), fsa.allFiles.get(screen.outputPath).toString)	
    }
    def mappingPath (String screenName){
    	mappingPath+screenName+".mapping"
    }
    
    def screenPath (String screenName){
    	screenPath+screenName+".screen"
    }
    
    def generatedPath(String screenName){
    	generatedPath+screenName+"Screen.groovy"
    }
    
    def outputPath(String screenName){
    	outputPath+screenName+"Screen.groovy"
    }
       	/**
	 * Name with pending .screen
	 */
	def loadScreen(XtextResourceSet xtextResourceSet, String name) {
		xtextResourceSet.getResource(URI.createURI("classpath:/"+name), true).load(null)
	}
        } 