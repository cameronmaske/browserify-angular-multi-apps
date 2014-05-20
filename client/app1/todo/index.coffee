module.exports =
    angular.module('todo', [
        require('./controllers').name,
        require('./services').name])