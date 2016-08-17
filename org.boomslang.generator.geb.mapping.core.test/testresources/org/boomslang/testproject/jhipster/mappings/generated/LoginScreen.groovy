package org.boomslang.testproject.jhipster.screens

class LoginScreen extends org.boomslang.pages.BoomslangScreen {

	static url = "#/login"

	static at = { waitFor { title == "Login" } }

	static content = {
		UserName (required: true) { $("#username") }
		Password (required: true) { $("#password") }
		Submit (required: true , wait:true) { $("#submit") }
	}

}
