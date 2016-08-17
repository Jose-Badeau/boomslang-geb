package org.boomslang.testproject.jhipster.screens

class LoginScreen extends org.boomslang.pages.BoomslangScreen {

	static url = "#/login"

	static at = { waitFor { title == "Login" } }

	static content = {
		userName (required: true) { module org.boomslang.test.jhipster.TextInputModule, $("#username") }
		password (required: true) { module org.boomslang.module.BoomslangModule, $("#password") }
		submit (required: true , wait:true) { module org.boomslang.test.jhipster.DropdownModule, $("#submit") }
	}

}
