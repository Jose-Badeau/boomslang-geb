package org.boomslang.navigators

import geb.navigator.Navigator
import geb.navigator.NonEmptyNavigator

import org.openqa.selenium.WebElement

import org.birdseye.compare.comparer.CompareResult
import org.birdseye.compare.facade.CompareCommand
import org.birdseye.compare.facade.CompareContext
import org.birdseye.compare.facade.DefaultCompareContext

class BoomslangNonEmptyNavigator extends NonEmptyNavigator implements BoomslangNavigator {

	protected CompareContext context = new DefaultCompareContext()

	protected CompareCommand compareCommand

	BoomslangNonEmptyNavigator(Navigator navigator) {
		super(navigator.browser, navigator.contextElements)
		context.setProjectCode(browser.config.rawConfig.birdseye.project)
		context.setRunTagCode(browser.config.rawConfig.birdseye.currentVersion)
		context.setBaseTagCode(browser.config.rawConfig.birdseye.baselineVersion)
		context.setImageStoreManager(browser.config.rawConfig.birdseye.storeManager)
		compareCommand = browser.config.rawConfig.birdseye.compareCommand
	}

	def looksLike(String name, Queue<WebElement> filterElements) {
		CompareResult result = compareCommand.filterElementsCompareGenerateDiff(context, name, getBrowser().getDriver(), filterElements)
		context.getImageStoreManager().saveDiffImage(context, name, result.getDiffImage())
		result.isMatch()
	}
	
	def cellValue(row, column) {
		
	}
}
