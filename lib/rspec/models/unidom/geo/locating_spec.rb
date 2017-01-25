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

  end

end
