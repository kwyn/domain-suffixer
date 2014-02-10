angular.module "suffixer", ['ngRoute']
  .config ($routeProvider) => 
    $routeProvider.when '/' , {
      controller : 'frameController'
    }
    .otherwise {
      redirectTo : '/'
    }
  .controller 'frameController', ($scope) =>
    $scope.idea = ''

