# Unidom Geo Change Log 地理领域模型引擎变更日志

## v0.1
1. Location model & migration (20010401000000)
2. Locating model & migration (20010402000000)

## v0.2
1. Improved the Location model to include the Model Extension concern
2. Improved the Locating model to include the Model Extension concern

## v0.3
1. Improved the Location model to add the ``has_may :locatings`` macro
2. Improved the Locating model for the class name
3. Improved the Locating model to add the #``locate!`` method
4. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.0
1. Improved the Locating model to support the Keyword Arguments
2. Improved the Location model to add the #``locate!`` method

## v1.0.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.1
1. As Located concern
2. As Region concern

## v1.2
1. Improved the As Located concern to add the #``is_located!`` method
2. Improved the Location model to add the #``locate?`` method

## v1.3
1. Improved the As Located concern to add the #``is_located?`` method
2. As Locator concern

## v1.4
1. Improved the As Locator concern to add the #``locate!`` method

## v1.4.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.4.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.4.3
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.4.4
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improved the Engine class to include the Engine Extension concern

## v1.4.5
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improved the models to support the namespace neglecting

## v1.5
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.5.1
1. Improved the Location spec for the validations on the #``latitude`` attribute, the #``longitude`` attribute, the #postal_address attribute, the #postal_code attribute, the #minimum_latitude attribute, the #maximum_latitude attribute, the #minimum_longitude attribute, & the #maximum_longitude attribute

## v1.5.2
1. Improved the Location spec for the postal_address_is scope

## v1.5.3
1. Improved the Location spec for the ``has_many :locatings, class_name: 'Unidom::Geo::Locating'`` macro
2. Improve the Locating spec for the ``belongs_to :location, class_name: 'Unidom::Geo::Location'`` macro

## v1.5.4
1. Improve the Locating spec for the ``location_is`` scope

## v1.5.5
1. Improve the Location spec for the validations on the #latitude attribute, the #longitude attribute, the #postal_address attribute, the #postal_code attribute, the #minimum_latitude attribute, the #maximum_latitude attribute, the #minimum_longitude attribute, & the #maximum_longitude attribute

## v1.5.6
1. As Located shared examples
2. As Region shared examples
3. RSpec shared examples manifest

## v1.5.7
1. Improve the As Located concern for the argument validation
2. Improve the As Located shared examples for the #is_located! method, & the #is_located? method

## v1.5.8
1. Improve the As Locator concern for the argument validations of the #locate! method
2. As Locator shared examples
