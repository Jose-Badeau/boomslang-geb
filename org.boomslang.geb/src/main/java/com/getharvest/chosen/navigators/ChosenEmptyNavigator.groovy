package com.getharvest.chosen.navigators

import geb.navigator.Navigator
import org.boomslang.navigators.BoomslangEmptyNavigator

class ChosenEmptyNavigator extends BoomslangEmptyNavigator implements ChosenNavigator {

	ChosenEmptyNavigator(Navigator navigator) {
		super(navigator)
	}
}
