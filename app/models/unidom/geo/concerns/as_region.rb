module Unidom::Geo::Concerns::AsRegion

  extend ActiveSupport::Concern

  included do |includer|

    has_many :locations, class_name: 'Unidom::Geo::Location'
    has_many :locatings, through:    :locations,              source: :locatings

  end

  module ClassMethods
  end

end
