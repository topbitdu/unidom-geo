# Unidom Geo 地理领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-geo/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-geo.svg)](https://badge.fury.io/rb/unidom-geo)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-geo.svg)](https://gemnasium.com/github.com/topbitdu/unidom-geo)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Geo domain model engine includes Town and Location models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。地理领域模型引擎包括乡镇和街道地址的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile:

```ruby
gem 'unidom-geo'
```



## Run the Database Migration:

```shell
rake db:migrate
```
The migration versions start with 200104.



## Call the Model:

```ruby
Unidom::Geo::Location.valid_at.alive.first.region

active_locatings = location.locatings.valid_at.alive

# Locate: associate a shop, an estate, or a facility with a location
location.locate! shop, by: person
# or
Unidom::Geo::Locating.locate! location: location, located: shop

# Determine whether a shop was located to a given location at a given time.
location.locate? shop, at: Time.now
```



## Include the Concerns:

```ruby
include Unidom::Geo::Concerns::AsLocated
include Unidom::Geo::Concerns::AsLocator
include Unidom::Geo::Concerns::AsRegion
```

### As Located concern

The As Located concern do the following tasks for the includer automatically:
1. Define the has_many :locatings macro as: ``has_many :locatings, class_name: 'Unidom::Geo::Locating', as: :located``
2. Define the has_many :locations macro as: ``has_many :locations, through: :locatings, source: :location``
3. Define the #is_located! method as: ``is_located!(to: nil, by: nil, at: Time.now)``
4. Define the #is_located? method as: ``is_located?(to: nil, at: Time.now)``

### As Locator concern

The As Locator concern do the following tasks for the includer automatically:
1. Define the has_many :locatings macro as: ``has_many :locatings, class_name: 'Unidom::Geo::Locating', as: :locator``
2. Define the has_many :locations macro as: ``has_many :locations, through: :locatings, source: :location``
3. Define the #locate! method as: ``locate!(it, to: nil, at: Time.now)``

### As Region concern

The As Region concern do the following tasks for the includer automatically:
1. Define the has_many :locations macro as: ``has_many :locations, class_name: 'Unidom::Geo::Location'``
2. Define the has_many :locatings macro as: ``has_many :locatings, through: :locations, source: :locatings``



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Geo
  }

end
```



## RSpec examples

```ruby
# spec/models/unidom_spec.rb
require 'unidom/geo/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/geo/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/geo/validators_rspec'
```
