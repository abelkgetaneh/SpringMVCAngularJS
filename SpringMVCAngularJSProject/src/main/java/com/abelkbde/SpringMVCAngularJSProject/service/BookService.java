package com.abelkbde.SpringMVCAngularJSProject.service;

import java.util.List;

import com.abelkbde.SpringMVCAngularJSProject.model.Book;

public interface BookService {

	Book findBookById(Integer id);
    
    Book findBookByTitle(String title);    
     
    void saveBook(Book book);
     
    void updateBook(Book book);
     
    void deleteBookById(Integer id);
 
    List<Book> findAllBooks(); 
     
    void deleteAllBooks();
     
    boolean isBookExist(Book book);
}
