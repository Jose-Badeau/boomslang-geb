package org.boomslang.browsers;

import geb.Browser;
import geb.Configuration;

import java.util.Map;

public class BoomslangBrowser extends Browser {

	BoomslangBrowser() {
		super();
	}

	/**
	 * Create a new browser backed by the given configuration.
	 * 
	 * @see geb.Configuration
	 */
	BoomslangBrowser(Configuration config) {
		super(config);
	}

	/**
	 * Creates a new browser instance backed by the given configuration, then
	 * applies {@code props} as property overrides on the browser.
	 * 
	 * @see geb.Configuration
	 */
	BoomslangBrowser(Map props, Configuration config) {
		super(props, config);
	}

}
