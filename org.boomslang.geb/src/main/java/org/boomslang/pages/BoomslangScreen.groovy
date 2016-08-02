package org.boomslang.pages;

import geb.Browser
import geb.Page
import geb.content.SimplePageContent

import org.openqa.selenium.WebElement

import org.birdseye.compare.comparer.CompareResult
import org.birdseye.compare.facade.CompareCommand
import org.birdseye.compare.facade.CompareContext
import org.birdseye.compare.facade.DefaultCompareContext
import org.birdseye.compare.filter.Filter
import org.birdseye.compare.filter.ObserveBlockFilter

class BoomslangScreen extends Page {

	protected CompareContext context = new DefaultCompareContext();

	protected CompareCommand compareCommand;

	@Override
	public Page init(Browser browser) {
		super.init(browser);
		context.setProjectCode(browser.config.rawConfig.birdseye.project);
		context.setRunTagCode(browser.config.rawConfig.birdseye.currentVersion);
		context.setBaseTagCode(browser.config.rawConfig.birdseye.baselineVersion);
		context.setImageStoreManager(browser.config.rawConfig.birdseye.storeManager);
		compareCommand = browser.config.rawConfig.birdseye.compareCommand;
		this
	}

	def looksLikeIncluding(String name, ArrayList<SimplePageContent> includes, boolean tag) {
		Queue<Filter> filterElements = new ArrayDeque<Filter>()
		for(SimplePageContent pageContent in includes) {
			filterElements.add(new ObserveBlockFilter(pageContent.firstElement()))
		}
		looksLike(name, filterElements, tag)
	}

	def looksLikeExcluding(String name, ArrayList<SimplePageContent> excludes, boolean tag) {
		Queue<WebElement> filterElements = new ArrayDeque<WebElement>()
		for(SimplePageContent pageContent in excludes) {
			filterElements.add(pageContent.firstElement())
		}
		looksLike(name, filterElements, tag)
	}

	def looksLike(String name, Queue<Filter> filterElements, tag) {
		if(tag || browser.config.rawConfig.birdseye.tag) {
			context.setRunTagCode(browser.config.rawConfig.birdseye.baselineVersion);
		}
		else {
			context.setRunTagCode(browser.config.rawConfig.birdseye.currentVersion);
		}
		CompareResult result = compareCommand.filterElementsCompareGenerateDiff(context, name, getBrowser().getDriver(), filterElements)
		context.getImageStoreManager().saveDiffImage(context, name, result.getDiffImage())
		result.isMatch()
	}
}
