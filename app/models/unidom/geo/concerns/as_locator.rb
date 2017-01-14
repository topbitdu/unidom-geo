##
# As Locator 是为定位者或者定位程序提供的领域逻辑关注点。

module Unidom::Geo::Concerns::AsLocator

  extend ActiveSupport::Concern

  included do |includer|

    has_many :locatings, class_name: 'Unidom::Geo::Locating', as:     :locator
    has_many :locations, through:    :locatings,              source: :location

    def locate!(it, to: nil, at: Time.now)
      locatings.location_is(to).located_is(it).valid_at(now: at).alive.first_or_create! opened_at: at
    end

  end

  module ClassMethods
  end

end
