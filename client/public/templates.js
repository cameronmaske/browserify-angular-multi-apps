(function(module) {
try {
  module = angular.module('ngTemplates');
} catch (e) {
  module = angular.module('ngTemplates', []);
}
module.run(['$templateCache', function($templateCache) {
  $templateCache.put('todoList.template',
    '<div class="row panel todo-panel">\n' +
    '  <div class="large-8 columns">\n' +
    '    <h2 class="subheader">\n' +
    '      {{remaining()}} of {{todos.length}} remaining\n' +
    '    </h2>\n' +
    '  </div>\n' +
    '  <div class="large-4 columns">\n' +
    '    <button class="button tiny todo-archive" ng-click="archive()">\n' +
    '      Archive\n' +
    '    </button>\n' +
    '  </div>\n' +
    '\n' +
    '  <div class="large-12 columns" ng-repeat="todo in todos">\n' +
    '    <input type="checkbox" ng-model="todo.done">\n' +
    '    <label class="done-{{todo.done}}">\n' +
    '      {{todo.text}}\n' +
    '    </label>\n' +
    '  </div>\n' +
    '  <form class="large-12 columns" ng-submit="addTodo()">\n' +
    '    <input type="text" ng-model="todoText"size="30" placeholder="add new todo here">\n' +
    '    <input class="button" type="submit" value="Add">\n' +
    '  </form>\n' +
    '</div>');
}]);
})();
