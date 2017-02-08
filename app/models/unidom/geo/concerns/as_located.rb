##
# As Located 是为地标提供的领域逻辑关注点。

module Unidom::Geo::Concerns::AsLocated

  extend ActiveSupport::Concern

  included do |includer|

    has_many :locatings, class_name: 'Unidom::Geo::Locating', as:     :located
    has_many :locations, through:    :locatings,              source: :location

    ##
    # 将当前位置与地标 to 关联起来。如：
    # location = Unidom::Geo::Location.first
    # shop.is_located! to: location, by: current_person
    def is_located!(to: nil, by: nil, at: Time.now)
      locatings.location_is(to).valid_at(now: at).alive.first_or_create! locator: by, opened_at: at
    end

    ##
    # 检查当前位置与地标 to 在指定的时间 at （缺省是当前时间）是否关联起来了。
    # location = Unidom::Geo::Location.first
    # 如： shop.is_located? to: location, at: Time.now
    def is_located?(to: nil, at: Time.now)
      locatings.location_is(to).valid_at(now: at).alive.exists?
    end

  end

  module ClassMethods
  end

end
