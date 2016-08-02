package org.boomslang.navigators

import geb.Browser
import geb.navigator.EmptyNavigator
import geb.navigator.Navigator;

class BoomslangEmptyNavigator extends EmptyNavigator implements BoomslangNavigator {

	BoomslangEmptyNavigator(Navigator navigator) {
		super(navigator.browser)
	}
	
	def cellValue(row, column) {
	}
	
}
