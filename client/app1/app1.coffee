require('angular/angular')
require('angular-route/angular-route')
require('ui-router/release/angular-ui-router')

installed_apps = [
  # 3rd party
  'ngTemplates',
  'ui.router',
  require('./todo').name
]

app = angular.module('app1', installed_apps)
  .config(require('./urls'))
