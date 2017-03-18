shared_examples 'Unidom::Geo::Concerns::AsLocated' do |model_attributes|

  locating_1_attribtues = {
      location_id:  SecureRandom.uuid,
      locator_id:   SecureRandom.uuid,
      locator_type: 'Unidom::Geo::Locator::Mock'
    }

  locating_2_attribtues = {
      location_id:  SecureRandom.uuid,
      locator_id:   SecureRandom.uuid,
      locator_type: 'Unidom::Geo::Locator::Mock'
    }

  it_behaves_like 'has_many', model_attributes, :locatings, Unidom::Geo::Locating, [ locating_1_attribtues, locating_2_attribtues ]

end
