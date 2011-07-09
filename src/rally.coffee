Model = require './Model'
modelServer = require './Model.server'
Store = require './Store'

# Add the server side functions to Model's prototype
for name, fn of modelServer
  Model::[name] = fn

module.exports =
  store: store = new Store
  subscribe: (path, callback) ->
    # TODO: Accept a list of paths
    # TODO: Attach to an existing model
    # TODO: Support path wildcards, references, and functions
    model = new Model
    store.get path, (err, value, ver) ->
      callback err if err
      model._set path, value
      model._base = ver
      callback null, model
  unsubscribe: ->
    throw "Unimplemented"
  use: ->
    throw "Unimplemented"