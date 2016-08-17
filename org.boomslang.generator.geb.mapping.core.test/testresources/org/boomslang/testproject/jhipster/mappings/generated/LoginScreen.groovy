package org.boomslang.testproject.jhipster.screens

class LoginScreen extends org.boomslang.pages.BoomslangScreen {

	static url = "#/login"

	static at = { waitFor { title == "Login" } }

	static content = {
		UserName (required: true) { module org.boomslang.test.jhipster.TextInputModule, $("#username") }
		Password (required: true) { module org.boomslang.module.BoomslangModule, $("#password") }
		Submit (required: true , wait:true) { module org.boomslang.test.jhipster.DropdownModule, $("#submit") }
	}

}
