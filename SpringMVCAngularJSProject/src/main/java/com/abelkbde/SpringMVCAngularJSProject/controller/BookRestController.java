package com.abelkbde.SpringMVCAngularJSProject.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.abelkbde.SpringMVCAngularJSProject.model.Book;
import com.abelkbde.SpringMVCAngularJSProject.service.BookService;

@RestController(value = "/book")
public class BookRestController {

	
	private static final Logger LOGGER = Logger.getLogger(BookRestController.class);
	
	//The class which does all the business logic on data
	@Autowired
	private BookService bookService;
	
	//-------------------------Fetch All Books---------------------------
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ResponseEntity<List<Book>> listAllBooks(){
		LOGGER.info("Fetching all books");
		List<Book> books = bookService.findAllBooks();
		if(books.isEmpty()) {
			return new ResponseEntity<List<Book>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Book>>(books, HttpStatus.OK);
	}
	
	//----------------------Fetch Single Book--------------------------------------------------------------------
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Book> getBook(@PathVariable("id") Integer id){
		LOGGER.info("Fetching book with id" + id);
		Book book = bookService.findBookById(id);
		if(book == null) {
			System.out.println("Book with id " + id + " not found");
			return new ResponseEntity<Book>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Book>(book, HttpStatus.OK);
	}
	
	//--------------------------Create a Book--------------------------------------------------
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<Void> createBook(@RequestBody Book book, UriComponentsBuilder ucBuilder){
		LOGGER.info("Creating Book " + book.getTitle());
		if(bookService.isBookExist(book)) {
			LOGGER.info("A book with name " + book.getTitle() + " already exists.");
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}
		bookService.saveBook(book);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/book/{id}").buildAndExpand(book.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}
	
	//----------------------Update a Book---------------------------------------------------------
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public ResponseEntity<Book> updateBook(@PathVariable("id") Integer id, @RequestBody Book book){
		LOGGER.info("Updating User " + id);
		Book currentBook= bookService.findBookById(id);
		
		if(currentBook == null) {
			LOGGER.info("Book with id " + id + " not found");
			return new ResponseEntity<Book>(HttpStatus.NOT_FOUND);
		}
		
		currentBook.setId(book.getId());
		currentBook.setTitle(book.getTitle());
		currentBook.setAuthor(book.getAuthor());
	
       
		
		bookService.updateBook(currentBook);
		return new ResponseEntity<Book>(currentBook, HttpStatus.OK);
	}
	
	//---------------------Delete a Book------------------------------------------------------
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Book> deleteBookById(@PathVariable("id") Integer id){
		LOGGER.info("Fetching and deleting a book with id " + id);
		Book currentBook= bookService.findBookById(id);
		if(currentBook == null) {
			LOGGER.info("Unable to delete Book with id " + id + " not found.");
			return new ResponseEntity<Book>(HttpStatus.NOT_FOUND);
		}
		bookService.deleteBookById(id);
		return new ResponseEntity<Book>(HttpStatus.NO_CONTENT);
	}
	
	//--------------------Delete All Books----------------------------------------------------
	@RequestMapping(value = "/", method = RequestMethod.DELETE)
	public ResponseEntity<Book> deleteAllBooks(){
		LOGGER.info("Deleting all books");
		bookService.deleteAllBooks();
		return new ResponseEntity<Book>(HttpStatus.NO_CONTENT);
	}
}
