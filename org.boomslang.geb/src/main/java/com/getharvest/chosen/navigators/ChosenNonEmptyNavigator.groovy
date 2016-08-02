package com.getharvest.chosen.navigators

import java.util.Collection;

import org.openqa.selenium.WebElement;

import geb.Browser;
import geb.navigator.Navigator;
import org.boomslang.navigators.BoomslangNonEmptyNavigator

class ChosenNonEmptyNavigator extends BoomslangNonEmptyNavigator implements ChosenNavigator {

	ChosenNonEmptyNavigator(Navigator navigator) {
		super(navigator)
	}

	@Override
	Navigator value(value) {
		browser.js.exec(firstElement(), value, "jQuery(arguments[0]).filter(function(index) { return jQuery(this).text() === 'arguments[1]'; }).attr('selected', 'selected');")
		//browser.js.exec(firstElement(), value, "jQuery(arguments[0]).val(arguments[1]).trigger('liszt:updated'));")
	}
}
