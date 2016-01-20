class ExampleComponent
  restrict: "E"
  replace: true
  templateUrl: "components/example/example.component.html"
  scope:
    percent: "@"
  bindToController: true
  controllerAs: "vm"
  controller: ($scope)->

  link: (scope, el, attr, ctrl)->
    # Link
    return

# Inject
ExampleComponent.$inject = []

angular.module("APPNAMESLUG.components").directive("progress",-> new ExampleComponent())
