package org.boomslang.navigators

import geb.navigator.EmptyNavigator;
import geb.navigator.Navigator
import geb.navigator.NonEmptyNavigator;

class BoomslangNavigatorFactory {

	BoomslangNavigatorFactory() {
	}

	Navigator createFromNavigator(Navigator navigator, Class<NonEmptyNavigator> nonEmptyNavigator, Class<EmptyNavigator> emptyNavigator) {
		if(navigator.contextElements != null) {
			return nonEmptyNavigator.newInstance(navigator);
		}
		else {
			return emptyNavigator.newInstance(navigator);
		}
	}
}
