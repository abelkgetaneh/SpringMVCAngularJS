<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Spring MVC AngularJS Project</title>
<style>
	.title.ng-valid {
		background-color: lightgreen;
	}
	.title.ng-dirty.ng-invalid-required {
		background-color: red;
	}
	.title.ng-dirty.ng-invalid-minlength {
		background-color: yellow;
	}	
	.author.ng-valid {
		background-color: lightgreen;
	}
	.author.ng-dirty.ng-invalid-required {
		background-color: red;
	}
	.author.ng-dirty.ng-invalid-minlength {
		background-color: yellow;
	}	
	
</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body data-ng-app="myBookApp" class="ng-cloak">
      <div class="generic-container" data-ng-controller="BookController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Book Registration Form </span></div>
              <div class="formcontainer">
                  <form data-ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" data-ng-model="ctrl.book.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="title">Title</label>
                              <div class="col-md-7">
                                  <input type="text" data-ng-model="ctrl.book.title" id="title" class="title form-control input-sm" placeholder="Enter title of the book" required data-ng-minlength="5"/>
                                  <div class="has-error" data-ng-show="myForm.$dirty">
                                      <span data-ng-show="myForm.title.$error.required">This is a required field</span>
                                      <span data-ng-show="myForm.title.$error.minlength">Minimum length required is 5</span>
                                      <span data-ng-show="myForm.title.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="author">Author</label>
                              <div class="col-md-7">
                                  <input type="text" data-ng-model="ctrl.book.author" id="author" class="form-control input-sm" placeholder="Enter Author's Name"/>                                  		
                          	  </div>	
                      	  </div>  
                      </div>                  
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.book.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" data-ng-disabled="myForm.$invalid"/>
                              <button type="button" data-ng-click="ctrl.reset()" class="btn btn-warning btn-sm" data-ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Books </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID</th>
                              <th>Title</th>
                              <th>Author</th>                              
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr data-ng-repeat="b in ctrl.books">
                              <td><span data-ng-bind="b.id"></span></td>
                              <td><span data-ng-bind="b.title"></span></td>
                              <td><span data-ng-bind="b.author"></span></td>
                              <td>
                              <button type="button" data-ng-click="ctrl.edit(b.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" data-ng-click="ctrl.remove(b.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/book_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/book_controller.js' />"></script>
  </body>
</html>