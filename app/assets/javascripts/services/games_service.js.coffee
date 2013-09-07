angular.module('got').factory 'Games', ['$http', ($http) ->
  list = (next) ->
    $http.get('/games', params: {format: 'json'}).then (result) ->
      next(result.data)

  template = (next) ->
    $http.get('/games/new', params: {format: 'json'}).then (result) ->
      next(result.data)

  create = (data) ->
    $http.post('/games', {game: data, format: 'json'})

  update = (id, data) ->
    $http.put("/games/#{id}", {game: data, format: 'json'})

  find = (id, next) ->
    list (result) ->
      item = _(result).find (elem) ->
        "#{elem.id}" == id
      next(item)

  return {
    list: (next) -> list(next)
    new: (next) -> template(next)
    create: (data) -> create(data)
    update: (id, data) -> update(id, data)
    find: (id, next) -> find(id, next)
  }
]
