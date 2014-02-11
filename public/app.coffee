angular.module "suffixer", ['ngRoute']
  .config ($routeProvider, $locationProvider) => 
    $locationProvider.html5Mode true
    $routeProvider.when '/' , {
      controller : 'frameController',
      templateUrl : 'templates/frame.html'
    }
    .otherwise {
      redirectTo : '/'
    }
  .controller 'frameController', ($scope, $http) =>
    $scope.idea = ''
    $scope.results
    $scope.success = false
    $scope.fail = false

    whois = (domain) ->
      query = "?url=#{domain}"
      $http {
        method: 'GET',
        url: "/whois#{query}"
      }
      .then (res) ->
        console.log res

    $scope.search = (idea)->
      if (findIt $scope.idea) != undefined
        $scope.success = true
        $scope.fail = false
        $scope.results = findIt $scope.idea
        whois $scope.results
      else
        $scope.results = "no results :("
        $scope.success = false
        $scope.fail = true
      
