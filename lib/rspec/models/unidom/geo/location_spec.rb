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

  end

end
