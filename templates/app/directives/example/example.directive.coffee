class ExampleDirective
  restrict: "AC"
  scope:
    bordering: "@"
  controllerAs: "vm"
  controller: ($scope)->
    return
  link: (scope, el, attr, ctrl)->
    el.css({"color":attr.bordering})
    return

# Inject
ExampleDirective.$inject = []


angular.module("APPNAMESLUG.directives").directive("bordering",-> new ExampleDirective())
