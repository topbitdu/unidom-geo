describe Unidom::Geo::Location, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      region_id:         SecureRandom.uuid,
      region_type:       'Unidom::Geo::Region::Mock',
      longitude:         120.000000,
      latitude:          31.000000,
      postal_address:    'Somewhere',
      postal_code:       '812345',
      minimum_longitude: 119.990000,
      minimum_latitude:  30.990000,
      maximum_longitude: 120.010000,
      maximum_latitude:  31.010000
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates numericality', model_attributes, :latitude,
      range: -90..90,   minimum_inclusive: true, maximum_inclusive: true, allow_blank: false
    it_behaves_like 'validates numericality', model_attributes, :minimum_latitude,
      range: -90..90,   minimum_inclusive: true, maximum_inclusive: true, allow_blank: false
    it_behaves_like 'validates numericality', model_attributes, :maximum_latitude,
      range: -90..90,   minimum_inclusive: true, maximum_inclusive: true, allow_blank: false
    it_behaves_like 'validates numericality', model_attributes, :longitude,
      range: -180..180, minimum_inclusive: true, maximum_inclusive: true, allow_blank: false
    it_behaves_like 'validates numericality', model_attributes, :minimum_longitude,
      range: -180..180, minimum_inclusive: true, maximum_inclusive: true, allow_blank: false
    it_behaves_like 'validates numericality', model_attributes, :maximum_longitude,
      range: -180..180, minimum_inclusive: true, maximum_inclusive: true, allow_blank: false

    it_behaves_like 'validates text', model_attributes, :postal_address,
      length: 2..described_class.columns_hash['postal_address'].limit
    it_behaves_like 'validates text', model_attributes, :postal_code,
      length: 3..described_class.columns_hash['postal_code'].limit

    locating_1_attributes = {
      located_id:   SecureRandom.uuid,
      located_type: 'Unidom::Geo::Located::Mock',
      locator_id:   SecureRandom.uuid,
      locator_type: 'Unidom::Geo::Locator::Mock'
    }

    locating_2_attributes = {
      located_id:   SecureRandom.uuid,
      located_type: 'Unidom::Geo::Located::Mock',
      locator_id:   SecureRandom.uuid,
      locator_type: 'Unidom::Geo::Locator::Mock'
    }

    it_behaves_like 'has_many', model_attributes, :locatings, Unidom::Geo::Locating, [ locating_1_attributes, locating_2_attributes ]

    it_behaves_like 'scope', :postal_address_is, [
      { attributes_collection: [ model_attributes ], count_diff: 1, args: [ 'Somewhere'  ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ 'Somewhere1' ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ 'somewhere'  ] } ]

  end

end
