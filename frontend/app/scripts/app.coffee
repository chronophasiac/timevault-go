'use strict'

###*
 # @ngdoc overview
 # @name timevaultApp
 # @description
 # # timevaultApp
 #
 # Main module of the application.
###
angular
  .module('timevaultApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config([
    '$routeProvider', '$locationProvider', '$httpProvider',
    ($routeProvider, $locationProvider, $httpProvider) ->
      # Enable HTML5 History API for modern browsers
      $locationProvider.html5Mode(true)

      # Add support for HTTP PATCH
      defaults = $httpProvider.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

      $httpProvider.defaults.useXDomain = true
      delete defaults.common['X-Requested-With']

      $routeProvider
        .when '/',
          templateUrl: 'views/main.html'
          controller: 'MainCtrl'
        .when '/about',
          templateUrl: 'views/about.html'
          controller: 'AboutCtrl'
        .when '/pomodoros',
          templateUrl: 'views/pomodoros.html'
          controller: 'PomodorosCtrl'
        .when '/404',
          templateUrl: 'views/notfound.html'
          controller: 'NotfoundCtrl'
        .otherwise
          redirectTo: '/404'
  ])
