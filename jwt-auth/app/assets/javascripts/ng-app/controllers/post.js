angular.module('JwtWebTokens')
  .controller('PostCtrl', function ($scope,$http,$rootScope,$location,$route) {
    $scope.posts = [];
    $scope.get_post = [];
    $http.get("/api/posts?token="+ $rootScope.token).success(function(all_post) {
      $scope.posts.push(all_post)
    });

    $scope.delete = function(id) {
      $http.delete("/api/posts/"+ id +"?token="+ $rootScope.token).success(function(data) {
        $route.reload();
      });

    }

    $scope.edit = function(id) {
      $http.get("/api/posts/"+ id +"?token="+ $rootScope.token).success(function(pst) {
        $rootScope.post = pst
        $scope.get_post.push(pst);
        $location.path("/posts/edit");
      });

    }

    $scope.update = function(id) {
      $scope.post_value = { "title" : $scope.post.title }
      $http.put("/api/posts/"+ id +"?token="+ $rootScope.token, $scope.post_value ).success(function(p) {
        $location.path("/posts");
      });
    }

    $scope.addPost = function() {
      $scope.post_new_value = { "title" : $scope.post.new_title }
      $http.post("/api/posts?token="+ $rootScope.token, $scope.post_new_value).success(function(data) {
        $route.reload();
      });
      $scope.post.new_title = ''
    }
  });
