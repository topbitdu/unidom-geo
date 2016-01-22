# Unidom Geo

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Geo domain model engine includes Town and Location models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。地理领域模型引擎包括乡镇和街道地址的模型。

## Usage in Gemfile:
```ruby
gem 'unidom-geo'
```

## Run the Database Migration:
```shell
rake db:migrate
```

## Call the Model:
```ruby
Unidom::Geo::Location.valid_at.alive.first.region
```
