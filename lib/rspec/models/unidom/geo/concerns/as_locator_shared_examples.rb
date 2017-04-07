shared_examples 'Unidom::Geo::Concerns::AsLocator' do |model_attributes, located|

  context do

    locating_1_attribtues = {
        location_id:  SecureRandom.uuid,
        located_id:   SecureRandom.uuid,
        located_type: 'Unidom::Geo::Located::Mock'
      }

    locating_2_attribtues = {
        location_id:  SecureRandom.uuid,
        located_id:   SecureRandom.uuid,
        located_type: 'Unidom::Geo::Located::Mock'
      }

    it_behaves_like 'has_many', model_attributes, :locatings, Unidom::Geo::Locating, [ locating_1_attribtues, locating_2_attribtues ]

    model = described_class.create! model_attributes

    location_attributes = {
      region_id:         SecureRandom.uuid,
      region_type:       'Unidom::Geo::Region::Mock',
      longitude:         21.000000,
      latitude:          31.000000,
      postal_address:    'Some Address',
      postal_code:       '100000',
      minimum_longitude: 19.900000,
      minimum_latitude:  30.900000,
      maximum_longitude: 21.100000,
      maximum_latitude:  31.100000,
    }
    location = Unidom::Geo::Location.first_or_create! location_attributes

    it_behaves_like 'assert_present!', model, :locate!, [ located, { to: location, at: Time.now } ], [ { 0 => :it }, :to, :at ]

  end

end
