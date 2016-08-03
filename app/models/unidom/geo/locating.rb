# Locating 是地理定位，表示地理位置和被定位物体之间的关联。

class Unidom::Geo::Locating < ActiveRecord::Base

  self.table_name = 'unidom_locatings'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :location, class_name: 'Unidom::Geo::Location'
  belongs_to :located,  polymorphic: true
  belongs_to :locator,  polymorphic: true

  scope :location_is, ->(location) { where location: location }
  scope :located_is,  ->(located)  { where located:  located  }
  scope :located_by,  ->(locator)  { where locator:  locator  }

  def self.locate!(location: nil, located: nil, locator: nil, opened_at: Time.now)
    attributes = { opened_at: opened_at }
    if locator.present?
      attributes[:locator] = locator
    else
      attributes[:locator_id]   = Unidom::Common::NULL_UUID
      attributes[:locator_type] = ''
    end
    self.located_is(located).location_is(location).valid_at.alive.first_or_create! attributes
  end

end
