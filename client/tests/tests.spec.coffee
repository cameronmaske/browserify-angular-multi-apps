describe 'tests', ->
    todoItem = null

    beforeEach(angular.mock.module('todo'))

    beforeEach(inject (_todoItem_) ->
        # This is the standard way to mock with Angular and inject
        # in various required functionality.
        todoItem = _todoItem_
    )

    it 'should be defined', ->
        expect(todoItem).toBeDefined()

