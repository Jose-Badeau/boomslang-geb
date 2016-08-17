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
    
    
	@Inject
	XtextResourceSet xtextResourceSet
	
	
	@Test
    def test() {
    	xtextResourceSet.loadScreen("org/boomslang/testproject/jhipster/screens/Login.screen")
        val model= 'org/boomslang/testproject/jhipster/mappings/Login.mapping'.readFileIntoString().parse(xtextResourceSet)
        val fsa = new InMemoryFileSystemAccess()
        underTest.doGenerate(model.eResource, fsa)
        assertEquals(1,fsa.allFiles.size)
        assertTrue(fsa.allFiles.containsKey("OUTPUT_CONFIG_GEBorg/boomslang/testproject/jhipster/screens/LoginScreen.groovy"))
        assertEquals('org/boomslang/testproject/jhipster/mappings/generated/LoginScreen.groovy'.readFileIntoString(), fsa.allFiles.get("OUTPUT_CONFIG_GEBorg/boomslang/testproject/jhipster/screens/LoginScreen.groovy").toString
        )
       }
       	/**
	 * Name with pending .screen
	 */
	def loadScreen(XtextResourceSet xtextResourceSet, String name) {
		xtextResourceSet.getResource(URI.createURI("classpath:/"+name), true).load(null)
	}
        } 