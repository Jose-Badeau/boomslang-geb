package org.boomslang.modules

import geb.Module

class AuthenticationModule extends Module {

	static content = {

		// elements present if the user is not logged in
		User(required: false) { $('input', id: 'user') }
		Password(required: false) { $('input', id: 'password') }
		RememberMe(required: false) { $('input', id: 'rememberMe') }
		SignIn(required: false, to: TimeLoggerScreen) { $('button', id: 'signIn') }
		ForgotPassword(required: false) { $('a', id: 'forgotPassword') }

		// elements present if the user is logged in
		Logout(required: false, wait: false, to: LoginScreen) { $('a', id: 'logout') }
		ForgotPassword(required: false) { $('a', id: 'userName') }
	}

	boolean isLoggedIn() {
		!User.present
	}

	void login(String username, String password = "password") {
		if (loggedIn) throw new IllegalStateException("already logged in")
		User = username
		Password = password
		waitFor { SignIn.isDisabled() == false}
		SignIn.click()
	}

	void logout() {
		if (!loggedIn) throw new IllegalStateException("already logged out")
		ForgotPassword.click()
		Logout.click()
	}

}