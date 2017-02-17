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

    postal_address_max_length = described_class.columns_hash['postal_address'].limit
    postal_code_max_length    = described_class.columns_hash['postal_code'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :latitude,
      {                        } => 0,
      { latitude: nil          } => 2,
      { latitude: ''           } => 2,
      { latitude: 'A'          } => 1,
      { latitude: '10'         } => 0,
      { latitude: 10           } => 0,
      { latitude: '10.1'       } => 0,
      { latitude: 10.1         } => 0,
      { latitude: '-10'        } => 0,
      { latitude: -10          } => 0,
      { latitude: '-10.1'      } => 0,
      { latitude: -10.1        } => 0,
      { latitude: -90.000001   } => 1,
      { latitude: '-90.000001' } => 1,
      { latitude: -90          } => 0,
      { latitude: '-90'        } => 0,
      { latitude: -89.999999   } => 0,
      { latitude: '-89.999999' } => 0,
      { latitude: 90.000001    } => 1,
      { latitude: '90.000001'  } => 1,
      { latitude: 90           } => 0,
      { latitude: '90'         } => 0,
      { latitude: 89.999999    } => 0,
      { latitude: '89.999999'  } => 0

    it_behaves_like 'validates', model_attributes, :minimum_latitude,
      {                                } => 0,
      { minimum_latitude: nil          } => 2,
      { minimum_latitude: ''           } => 2,
      { minimum_latitude: 'A'          } => 1,
      { minimum_latitude: '10'         } => 0,
      { minimum_latitude: 10           } => 0,
      { minimum_latitude: '10.1'       } => 0,
      { minimum_latitude: 10.1         } => 0,
      { minimum_latitude: '-10'        } => 0,
      { minimum_latitude: -10          } => 0,
      { minimum_latitude: '-10.1'      } => 0,
      { minimum_latitude: -10.1        } => 0,
      { minimum_latitude: -90.000001   } => 1,
      { minimum_latitude: '-90.000001' } => 1,
      { minimum_latitude: -90          } => 0,
      { minimum_latitude: '-90'        } => 0,
      { minimum_latitude: -89.999999   } => 0,
      { minimum_latitude: '-89.999999' } => 0,
      { minimum_latitude: 90.000001    } => 1,
      { minimum_latitude: '90.000001'  } => 1,
      { minimum_latitude: 90           } => 0,
      { minimum_latitude: '90'         } => 0,
      { minimum_latitude: 89.999999    } => 0,
      { minimum_latitude: '89.999999'  } => 0

    it_behaves_like 'validates', model_attributes, :maximum_latitude,
      {                                } => 0,
      { maximum_latitude: nil          } => 2,
      { maximum_latitude: ''           } => 2,
      { maximum_latitude: 'A'          } => 1,
      { maximum_latitude: '10'         } => 0,
      { maximum_latitude: 10           } => 0,
      { maximum_latitude: '10.1'       } => 0,
      { maximum_latitude: 10.1         } => 0,
      { maximum_latitude: '-10'        } => 0,
      { maximum_latitude: -10          } => 0,
      { maximum_latitude: '-10.1'      } => 0,
      { maximum_latitude: -10.1        } => 0,
      { maximum_latitude: -90.000001   } => 1,
      { maximum_latitude: '-90.000001' } => 1,
      { maximum_latitude: -90          } => 0,
      { maximum_latitude: '-90'        } => 0,
      { maximum_latitude: -89.999999   } => 0,
      { maximum_latitude: '-89.999999' } => 0,
      { maximum_latitude: 90.000001    } => 1,
      { maximum_latitude: '90.000001'  } => 1,
      { maximum_latitude: 90           } => 0,
      { maximum_latitude: '90'         } => 0,
      { maximum_latitude: 89.999999    } => 0,
      { maximum_latitude: '89.999999'  } => 0

    it_behaves_like 'validates', model_attributes, :longitude,
      {                          } => 0,
      { longitude: nil           } => 2,
      { longitude: ''            } => 2,
      { longitude: 'A'           } => 1,
      { longitude: '10'          } => 0,
      { longitude: 10            } => 0,
      { longitude: '10.1'        } => 0,
      { longitude: 10.1          } => 0,
      { longitude: '-10'         } => 0,
      { longitude: -10           } => 0,
      { longitude: '-10.1'       } => 0,
      { longitude: -10.1         } => 0,
      { longitude: -180.000001   } => 1,
      { longitude: '-180.000001' } => 1,
      { longitude: -180          } => 0,
      { longitude: '-180'        } => 0,
      { longitude: -179.999999   } => 0,
      { longitude: '-179.999999' } => 0,
      { longitude: 180.000001    } => 1,
      { longitude: '180.000001'  } => 1,
      { longitude: 180           } => 0,
      { longitude: '180'         } => 0,
      { longitude: 179.999999    } => 0,
      { longitude: '179.999999'  } => 0

    it_behaves_like 'validates', model_attributes, :minimum_longitude,
      {                                  } => 0,
      { minimum_longitude: nil           } => 2,
      { minimum_longitude: ''            } => 2,
      { minimum_longitude: 'A'           } => 1,
      { minimum_longitude: '10'          } => 0,
      { minimum_longitude: 10            } => 0,
      { minimum_longitude: '10.1'        } => 0,
      { minimum_longitude: 10.1          } => 0,
      { minimum_longitude: '-10'         } => 0,
      { minimum_longitude: -10           } => 0,
      { minimum_longitude: '-10.1'       } => 0,
      { minimum_longitude: -10.1         } => 0,
      { minimum_longitude: -180.000001   } => 1,
      { minimum_longitude: '-180.000001' } => 1,
      { minimum_longitude: -180          } => 0,
      { minimum_longitude: '-180'        } => 0,
      { minimum_longitude: -179.999999   } => 0,
      { minimum_longitude: '-179.999999' } => 0,
      { minimum_longitude: 180.000001    } => 1,
      { minimum_longitude: '180.000001'  } => 1,
      { minimum_longitude: 180           } => 0,
      { minimum_longitude: '180'         } => 0,
      { minimum_longitude: 179.999999    } => 0,
      { minimum_longitude: '179.999999'  } => 0

    it_behaves_like 'validates', model_attributes, :maximum_longitude,
      {                                  } => 0,
      { maximum_longitude: nil           } => 2,
      { maximum_longitude: ''            } => 2,
      { maximum_longitude: 'A'           } => 1,
      { maximum_longitude: '10'          } => 0,
      { maximum_longitude: 10            } => 0,
      { maximum_longitude: '10.1'        } => 0,
      { maximum_longitude: 10.1          } => 0,
      { maximum_longitude: '-10'         } => 0,
      { maximum_longitude: -10           } => 0,
      { maximum_longitude: '-10.1'       } => 0,
      { maximum_longitude: -10.1         } => 0,
      { maximum_longitude: -180.000001   } => 1,
      { maximum_longitude: '-180.000001' } => 1,
      { maximum_longitude: -180          } => 0,
      { maximum_longitude: '-180'        } => 0,
      { maximum_longitude: -179.999999   } => 0,
      { maximum_longitude: '-179.999999' } => 0,
      { maximum_longitude: 180.000001    } => 1,
      { maximum_longitude: '180.000001'  } => 1,
      { maximum_longitude: 180           } => 0,
      { maximum_longitude: '180'         } => 0,
      { maximum_longitude: 179.999999    } => 0,
      { maximum_longitude: '179.999999'  } => 0

    it_behaves_like 'validates', model_attributes, :postal_address,
      {                                                   } => 0,
      { postal_address: nil                               } => 2,
      { postal_address: ''                                } => 2,
      { postal_address: 'A'                               } => 1,
      { postal_address: 'AA'                              } => 0,
      { postal_address: 'AAA'                             } => 0,
      { postal_address: 'A'*(postal_address_max_length-1) } => 0,
      { postal_address: 'A'*postal_address_max_length     } => 0,
      { postal_address: 'A'*(postal_address_max_length+1) } => 1

    it_behaves_like 'validates', model_attributes, :postal_code,
      {                                             } => 0,
      { postal_code: nil                            } => 2,
      { postal_code: ''                             } => 2,
      { postal_code: 'A'                            } => 1,
      { postal_code: 'AA'                           } => 1,
      { postal_code: 'AAA'                          } => 0,
      { postal_code: 'A'*(postal_code_max_length-1) } => 0,
      { postal_code: 'A'*postal_code_max_length     } => 0,
      { postal_code: 'A'*(postal_code_max_length+1) } => 1

    it_behaves_like 'scope', :postal_address_is, [
      { attributes_collection: [ model_attributes ], count_diff: 1, args: [ 'Somewhere'  ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ 'Somewhere1' ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ 'somewhere'  ] } ]

  end

end
