describe Unidom::Geo::Locating, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      location_id:  SecureRandom.uuid,
      located_id:   SecureRandom.uuid,
      located_type: 'Unidom::Geo::Located::Mock',
      locator_id:   SecureRandom.uuid,
      locator_type: 'Unidom::Geo::Locator::Mock'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    location_attributes = {
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

    it_behaves_like 'belongs_to', model_attributes, :location, Unidom::Geo::Location, location_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :location_is, :location

  end

end
