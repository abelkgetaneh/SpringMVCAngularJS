package com.abelkbde.SpringMVCAngularJSProject.service;

import java.util.List;

import com.abelkbde.SpringMVCAngularJSProject.model.Book;

public interface BookService {

	Book findBookById(long id);
    
    Book findBookByTitle(String title);
    
    Book findBookByAuthor(String author);
     
    void saveBook(Book book);
     
    void updateBook(Book book);
     
    void deleteBookById(long id);
 
    List<Book> findAllBooks(); 
     
    void deleteAllBooks();
     
    public boolean isBookExist(Book book);
}
