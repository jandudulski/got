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
    when('/players', {controller: 'PlayersCtrl', templateUrl: '/players.html'}).
    when('/games/new', {controller: 'NewGameCtrl', templateUrl: '/games/new.html'}).
    when('/', {controller: 'GamesCtrl', templateUrl: '/games.html'}).
    otherwise({redirectTo: '/'})
]
