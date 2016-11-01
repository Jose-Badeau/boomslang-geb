package org.boomslang.testproject.jhipster.features

import org.boomslang.testproject.jhipster.screens.Login


Feature Login

As a "User"
I want to "Login to the JHipster sample application"
In order to "See my account"

Scenario "Login"
	Given I am on the screen Login  
	when I from the UserName textfield I type "JohnDoe"
	and I from the Password textfield I type "Password"
	then the Submit button is not locked
	
Scenario "Login Wrong Password"
	Given I am on the screen Login 
	when I from the UserName textfield I type "JohnDoe"
	and I from the Password textfield I type "Password_Wrong"
	then the Submit button is not locked
	when I from the Submit button I click 
	then I am on the screen Login 