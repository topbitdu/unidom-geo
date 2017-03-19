shared_examples 'Unidom::Geo::Concerns::AsRegion' do |model_attributes|

  location_1_attribtues = {
      longitude:         120.000000,
      latitude:          31.000000,
      postal_address:    '#1 Some Street',
      postal_code:       '969696',
      minimum_longitude: 119.000000,
      minimum_latitude:  30.000000,
      maximum_longitude: 121.000000,
      maximum_latitude:  32.000000
    }

  location_2_attribtues = {
      longitude:         120.000000,
      latitude:          31.000000,
      postal_address:    '#2 Some Street',
      postal_code:       '979797',
      minimum_longitude: 119.000000,
      minimum_latitude:  30.000000,
      maximum_longitude: 121.000000,
      maximum_latitude:  32.000000
    }

  it_behaves_like 'has_many', model_attributes, :locations, Unidom::Geo::Location, [ location_1_attribtues, location_2_attribtues ]

end
