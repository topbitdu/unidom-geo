# Unidom Geo 地理领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-geo.svg)](https://badge.fury.io/rb/unidom-geo)

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
```

## Include the Concerns:
```ruby
include Unidom::Geo::Concerns::AsLocated
include Unidom::Geo::Concerns::AsRegion
```

### As Located concern
The As Located concern do the following tasks for the includer automatically:  
1. Define the has_many :locatings macro as: ``has_many :locatings, class_name: 'Unidom::Geo::Locating', as: :located``
2. Define the has_many :locations macro as: ``has_many :locations, through: :locatings, source: :location``

### As Region concern
The As Region concern do the following tasks for the includer automatically:  
1. Define the has_many :locations macro as: ``has_many :locations, class_name: 'Unidom::Geo::Location'``
2. Define the has_many :locatings macro as: ``has_many :locatings, through: :locations, source: :locatings``
