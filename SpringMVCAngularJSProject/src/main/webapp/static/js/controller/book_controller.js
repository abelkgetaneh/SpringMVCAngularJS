'use strict';

angular.module('bookApp').controller('BookController', ['$scope','BookService', function($scope, BookService){
	
	this.book = {id:null, title: '', author: ''};
	this.books = [];
	
	this.submit = submit;
	this.edit = edit;
	this.remove = remove;
	this.reset = reset;
	
	getAllBooks();
	
	function getAllBooks(){
		BookService.getAllBooks()
			.then(
			function(d){
				this.books = d;
			},
			function(errResponse){
				console.error('Error while fetching books');
			}			
		);
	};
	function createBook(book){
		BookService.createBook(book)
		.then(
				getAllBooks,
				function(errResponse){
					console.error('Error while creating book');
				}			
		);
	};
	function updateBook(book, id){
		BookService.updateBook()
		.then(
				getAllBooks,
				function(errResponse){
					console.error('Error while updating book');
				}			
		);
	};
	function deleteBook(){
		BookService.deleteBook()
		.then(
				getAllBooks,
				function(errResponse){
					console.error('Error while deleting book');
				}			
		);
	};
	function submit(){
		if(this.book.id === null){
			console.log('Saving New Book', this.book);
			createBook(this.book);
		}else{
			udpateBook(this.book, this.book.id);
			console.log('Book updated with id ', this.book.id);
		}
		reset();
	}
	function edit(id){
		console.log('id to be edited', id);
		for(var i=0; i < this.books.length; i++){
			if(this.books[i].id === id){
				this.book = angular.copy(this.books[id]);
				break;
			}
		}
	}
	function remove(id){
		console.log('id to be edited', id);
		if(this.book.id === id){
			reset();
		}
			deleteBook(id);
	}
	
	function reset(){
		this.book = {id: null, title: '', author: ''};
		$scope.myForm.$setPristine();
	}
}]);