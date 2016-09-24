module Unidom::Geo::Concerns::AsLocated

  extend ActiveSupport::Concern

  included do |includer|

    has_many :locatings, class_name: 'Unidom::Geo::Locating', as:     :located
    has_many :locations, through:    :locatings,              source: :location

    def is_located!(to: nil, by: nil, at: Time.now)
      locatings.location_is(to).valid_at(now: at).alive.first_or_create! locator: by, opened_at: at
    end

    def is_located?(to: nil, at: Time.now)
      locatings.location_is(to).valid_at(now: at).alive.exists?
    end

  end

  module ClassMethods
  end

end
