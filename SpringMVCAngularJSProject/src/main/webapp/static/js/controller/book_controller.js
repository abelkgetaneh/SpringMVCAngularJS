'use strict';

angular.module('bookApp').controller('BookController', ['$scope','BookService', function($scope, BookService){
	
	var vm = this;
	
	vm.book = {id:null, title: '', author: ''};
	vm.books = [];
	
	vm.submit = submit;
	vm.edit = edit;
	vm.remove = remove;
	vm.reset = reset;
	
	getAllBooks();
	
	function getAllBooks(){
		BookService.getAllBooks()
			.then(
			function(d){
				vm.books = d;
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
		if(vm.book.id === null){
			console.log('Saving New Book', vm.book);
			createBook(vm.book);
		}else{
			udpateBook(vm.book, vm.book.id);
			console.log('Book updated with id ', vm.book.id);
		}
		reset();
	}
	function edit(id){
		console.log('id to be edited', id);
		for(var i=0; i < vm.books.length; i++){
			if(vm.books[i].id === id){
				vm.book = angular.copy(vm.books[id]);
				break;
			}
		}
	}
	function remove(id){
		console.log('id to be edited', id);
		if(vm.book.id === id){
			reset();
		}
			deleteBook(id);
	}
	
	function reset(){
		vm.book = {id: null, title: '', author: ''};
		$scope.myForm.$setPristine();
	}
}]);