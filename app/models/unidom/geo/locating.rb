# Locating 是地理定位，表示地理位置和被定位物体之间的关联。

class Unidom::Geo::Location < ActiveRecord::Base

  self.table_name = 'unidom_locatings'

  belongs_to :location, class_name: 'Unidom::Geo::Location'
  belongs_to :located,  polymorphic: true
  belongs_to :locator,  polymorphic: true

  scope :location_is, ->(location) { where location: location }
  scope :located_is,  ->(located)  { where located:  located  }
  scope :located_by,  ->(locator)  { where locator:  locator  }

end
