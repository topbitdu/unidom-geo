# Location 是地理位置。具体对应到某一个街道地址。

class Unidom::Geo::Location < ActiveRecord::Base

  self.table_name = 'unidom_locations'

  include Unidom::Common::Concerns::ModelExtension

  validates :latitude,  presence: true, numericality: { greater_than_or_equal_to: -90,  less_than_or_equal_to: 90  }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  validates :postal_address, presence: true, length: { in: 2..self.columns_hash['postal_address'].limit }
  validates :postal_code,    presence: true, length: { in: 3..self.columns_hash['postal_code'].limit    }

  validates :minimum_latitude,  presence: true, numericality: { greater_than_or_equal_to: -90,  less_than_or_equal_to: 90  }
  validates :maximum_latitude,  presence: true, numericality: { greater_than_or_equal_to: -90,  less_than_or_equal_to: 90  }
  validates :minimum_longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :maximum_longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  belongs_to :region, polymorphic: true

  has_many :locatings, class_name: 'Unidom::Geo::Locating'

  scope :region_is,         ->(region)         { where region:         region         }
  scope :postal_address_is, ->(postal_address) { where postal_address: postal_address }

  def locate!(located, by: nil, at: Time.now)
    locatings.create! located: located, locator: by, opened_at: at
  end

end
