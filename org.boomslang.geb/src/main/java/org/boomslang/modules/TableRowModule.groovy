package org.boomslang.modules;

import geb.Module

class TableRowModule extends Module {
	static content = {
		cell { i -> $("td, th", i) }
	}
}