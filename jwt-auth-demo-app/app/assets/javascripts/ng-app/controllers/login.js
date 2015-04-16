'use strict';
angular.module('JwtWebTokens')
  .controller('LoginCtrl', function ($scope,$http,$rootScope,$location) {
    $scope.signin = [];
    $scope.message = "";
    $scope.username = "";
    $scope.signin = function(user) {
      $scope.credentials = { "email": $scope.user.email, "password" : $scope.user.password }
      $http.post('/api/authorize.json',$scope.credentials).success(function(data) {
        if (data.token) {
          $rootScope.token = data.token
          $rootScope.username = data.username
          $location.path("/posts");
        } else {
          $scope.message = data.message
        }
      });
    }
  });
