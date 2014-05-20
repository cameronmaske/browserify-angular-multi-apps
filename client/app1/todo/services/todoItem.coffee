module.exports = ->
    class TodoItem
        constructor: (attributes) ->
            @done = attributes.done or false
            @message = attributes.message or null
    return TodoItem
