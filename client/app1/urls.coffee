module.exports = ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state('todoList'
      url: '/'
      templateUrl: 'todoList.template'
      controller: 'todoListCtrl')
  $urlRouterProvider.otherwise('/')
