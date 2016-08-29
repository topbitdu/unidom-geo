module Unidom::Geo::Concerns::AsLocated

  extend ActiveSupport::Concern

  included do |includer|

    has_many :locatings, class_name: 'Unidom::Geo::Locating', as:     :located
    has_many :locations, through:    :locatings,              source: :location

  end

  module ClassMethods
  end

end
