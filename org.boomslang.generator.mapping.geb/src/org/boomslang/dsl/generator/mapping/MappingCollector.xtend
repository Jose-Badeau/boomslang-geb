package org.boomslang.dsl.generator.mapping

import com.google.inject.Inject
import org.eclipse.emf.common.util.BasicEList
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.resource.IContainer
import org.eclipse.xtext.resource.IResourceDescription
import org.eclipse.xtext.resource.IResourceDescriptions
import org.eclipse.xtext.resource.impl.ResourceDescriptionsProvider

/**
 * Util class to navigate from scenarios to mappings (from the mapping DSL) 
 */
class MappingCollector {

	@Inject
	private ResourceDescriptionsProvider resourceDescriptionsProvider;

	@Inject IContainer.Manager manager

// FIXME 

	/**
     * @return the mapping for a screen of a given scenario, or {@code null}
     * if the given resource was null, if the given resource did not contain a feature 
     * or if no mapping could be found
     */
//	def BMapping getMapping(BScenario bScenario) {
//		if (bScenario == null) {
//			return null
//		}
//
//		val screen = bScenario.testcode?.widgetContainer
//
//		val featureResource = bScenario.eResource
//		val candidateResources = featureResource.visibleResources
//
//		for (candidateResource : candidateResources) {
//			// TODO optimization: IResourceServiceProvider of mapping DSL .canHandle()
//			// TODO check if multiple mappings exist -> error
//			switch ( pack : candidateResource.contents.get(0)) {
//				BMappingPackage: {
//					val candidate = pack.BMapping
//					if (candidate?.screen == screen) {
//						return candidate
//					}
//
//				}
//			}
//		}
//		return null
//	}

	/**
	 * @param myResource - resource from which all visible resources should be computed
	 * 
	 * @return - list of visible resources 
	 * 
	 */
	def public getVisibleResources(Resource aResource) {
		val IResourceDescriptions descriptions = resourceDescriptionsProvider.getResourceDescriptions(aResource)
		getVisibleResources(aResource, descriptions)
	}

	/**
	 * @param index - resource descriptions, usually obtained from a resource description provider
	 */
	def private getVisibleResources(Resource origin, IResourceDescriptions index) {

		val IResourceDescription descr = index.getResourceDescription(origin.getURI())
		val result = new BasicEList<Resource>()

		// if the resource description is null, return empty list
		if (descr == null) {
			return result
		}
		for (IContainer visibleContainer : manager.getVisibleContainers(descr, index)) {
			for (IResourceDescription visibleResourceDesc : visibleContainer.getResourceDescriptions()) {
				result += origin.resourceSet.getResource(visibleResourceDesc.getURI, true)
			}
		}
		result
	}

}
