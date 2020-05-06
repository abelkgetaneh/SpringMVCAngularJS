'use strict';

angular.module('bookApp').factory('BookService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8084/SpringMVCAngularJSProject/book';

    var factory = {
        getAllBooks: getAllBooks,
        createBook: createBook,
        updateBook:updateBook,
        deleteBook:deleteBook
    };

    return factory;

    function getAllBooks() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching books');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function createBook(book) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, book)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating book');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateBook(book, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+id, book)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating book');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function deleteBook(id) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting book');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

}]);
