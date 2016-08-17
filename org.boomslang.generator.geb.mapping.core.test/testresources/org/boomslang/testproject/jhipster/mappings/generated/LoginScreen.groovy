package org.boomslang.testproject.jhipster.screens

class LoginScreen extends org.boomslang.pages.BoomslangScreen {

	static url = "#/login"

	static at = { waitFor { title == "Login" } }

	static content = {
		UserName (required: true , wait:true){module org.boomslang.test.jhipster.TextInputModule,$("#username)" }
		Password (required: true , wait:true){module org.boomslang.test.jhipster.TextInputModule,$("#password)" }
		Submit (required: true , wait:true){module org.boomslang.test.jhipster.ButtonInputModule,$("#submit)" }
	}

}
