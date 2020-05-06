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
		background-color: lightgreen
	}
	.author.ng-dirty.ng-invalid-required {
		background-color: red;
	}
	.author.ng-dirty.email {
		background-color: yellow;
	}
</style>
</head>
<body ng-app="bookApp" class="ng-cloak">
      <div class="generic-container" ng-controller="BookController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Book Registration Form </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.book.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="title">Title</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.book.title" id="title" class="title form-control input-sm" placeholder="Enter title of the book" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.title.$error.required">This is a required field</span>
                                      <span ng-show="myForm.title.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.title.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="author">Author</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.book.author" id="author" class="form-control input-sm" placeholder="Enter Author's Name. [This field is validation free]"/>
                              </div>
                          </div>
                      </div>                    
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.book.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
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
                          <tr ng-repeat="b in ctrl.books">
                              <td><span ng-bind="b.id"></span></td>
                              <td><span ng-bind="b.title"></span></td>
                              <td><span ng-bind="b.author"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(b.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(b.id)" class="btn btn-danger custom-width">Remove</button>
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