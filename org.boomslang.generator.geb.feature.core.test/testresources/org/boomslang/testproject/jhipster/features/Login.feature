package org.boomslang.testproject.jhipster.features

import org.boomslang.testproject.jhipster.screens.Login


Feature Login

As a "User"
I want to "Login to the JHipster sample application"
In order to "See my account"

Scenario "Login"
	Given I am on the Login screen 
	when I from the UserName textfield I type "JohnDoe"
	and I from the Password textfield I type "Password"
	then the Submit button is not locked