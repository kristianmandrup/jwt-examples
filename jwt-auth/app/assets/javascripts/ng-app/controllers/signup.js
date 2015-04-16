angular.module('JwtWebTokens')
  .controller('SignupCtrl', function ($scope,$location,$rootScope,$http) {
    $scope.signups = [];
    $scope.username = "";
    $scope.signup = function(user) {
      if ($scope.user.password == $scope.passwordCnf) {
        $scope.credentials = {"email": $scope.user.email, "password" : $scope.user.password, "auth_type" : 1}
        $http.post('/api/authorize',$scope.credentials).success(function(data) {
          $rootScope.token = data.token
          $rootScope.username = data.username
          $location.path("/posts");
        });
      } else {
        $scope.message = "Please Enter the valid Credentials";
      }
    }
  });
