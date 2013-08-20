# Initialize namespace
app = angular.module('got', [])

# Inject CSRF token
meta = document.querySelector('meta[name=csrf-token]')
if meta && meta.hasAttribute('content')
  app.config ['$httpProvider', (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = meta.getAttribute('content')
  ]
