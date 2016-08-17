package org.boomslang.testproject.jhipster.screens

class RegisterScreen extends org.boomslang.pages.BoomslangScreen {

	static url = "#/register"

	static at = { waitFor { title == "Register" } }

	static content = {
		Title (required: true , wait:true) { module org.boomslang.test.jhipster.DropdownModule, $("#register") }
	}

}
