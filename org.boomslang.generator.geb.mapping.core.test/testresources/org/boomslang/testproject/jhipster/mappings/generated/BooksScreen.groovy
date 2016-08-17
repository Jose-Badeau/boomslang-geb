package org.boomslang.testproject.jhipster.screens

class BooksScreen extends org.boomslang.pages.BoomslangScreen {

	static url = "#/books"

	static at = { waitFor { title == "Books" } }

	static content = {
		Books (required: true , wait:true) { module org.boomslang.testproject.jhipster.TableModule, $("#books") }
	}

}
