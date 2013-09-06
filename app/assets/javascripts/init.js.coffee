# Initialize namespace
app = angular.module('got', ['prevent-default', 'ngRoute'])

# Inject CSRF token
meta = document.querySelector('meta[name=csrf-token]')
if meta && meta.hasAttribute('content')
  app.config ['$httpProvider', (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = meta.getAttribute('content')
  ]

# Routing
app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/players', {controller: 'PlayersCtrl', templateUrl: '/assets/players/index.html'}).
    when('/games/:game_id/results/new', {controller: 'NewResultCtrl', templateUrl: '/assets/results/new.html'}).
    when('/games/:id/edit', {controller: 'EditGameCtrl', templateUrl: '/assets/games/edit.html'}).
    when('/games/new', {controller: 'NewGameCtrl', templateUrl: '/assets/games/new.html'}).
    when('/games/:id', {controller: 'GameCtrl', templateUrl: '/assets/games/show.html'}).
    when('/', {controller: 'GamesCtrl', templateUrl: '/assets/games/index.html'}).
    otherwise({redirectTo: '/'})
]
