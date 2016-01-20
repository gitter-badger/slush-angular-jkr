do ->
  angular.module "<%= appNameSlug %>.components",[]
  angular.module "<%= appNameSlug %>.config",[]
  angular.module "<%= appNameSlug %>.controllers",[]
  angular.module "<%= appNameSlug %>.core",[]
  angular.module "<%= appNameSlug %>.directives",[]
  angular.module "<%= appNameSlug %>.factories",[]
  angular.module "<%= appNameSlug %>.filters",[]
  angular.module "<%= appNameSlug %>.services",[]
  angular.module "<%= appNameSlug %>",[
    "<%= appNameSlug %>.components"
    "<%= appNameSlug %>.config"
    "<%= appNameSlug %>.controllers"
    "<%= appNameSlug %>.core"
    "<%= appNameSlug %>.directives"
    "<%= appNameSlug %>.factories"
    "<%= appNameSlug %>.filters"
    "<%= appNameSlug %>.services"
  ]
