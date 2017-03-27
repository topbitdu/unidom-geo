shared_examples 'Unidom::Geo::Concerns::AsLocated' do |model_attributes, location, locator|

  context do

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

    located = described_class.create! model_attributes

    it_behaves_like 'assert_present!', located, :is_located!, [ { to: location, by: locator, at: Time.now } ], [ :to, :by, :at ]
    it_behaves_like 'assert_present!', located, :is_located?, [ { to: location,              at: Time.now } ], [ :to,      :at ]

  end

end
