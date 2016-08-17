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
	
	
    @Inject BFeatureGenerator underTest
    @Inject extension ParseHelper<BFeaturePackage> parseHelper 
    
    
	@Inject
	XtextResourceSet xtextResourceSet
	
	
	@Test
    def test() {
    	xtextResourceSet.loadScreen("org/boomslang/testproject/jhipster/screens/Login.screen")
        val model= 'org/boomslang/testproject/jhipster/features/Login.feature'.readFileIntoString().parse(xtextResourceSet)
        val fsa = new InMemoryFileSystemAccess()
        underTest.doGenerate(model.eResource, fsa)
        assertEquals(1,fsa.allFiles.size)
        assertTrue(fsa.allFiles.containsKey("OUTPUT_CONFIG_GEBorg/boomslang/testproject/jhipster/features/LoginFeature.groovy"))
        assertEquals('org/boomslang/testproject/jhipster/features/generated/LoginFeature.groovy'.readFileIntoString(), fsa.allFiles.get("OUTPUT_CONFIG_GEBorg/boomslang/testproject/jhipster/features/LoginFeature.groovy").toString
        )
       }
       	/**
	 * Name with pending .screen
	 */
	def loadScreen(XtextResourceSet xtextResourceSet, String name) {
		xtextResourceSet.getResource(URI.createURI("classpath:/"+name), true).load(null)
	}
        } 