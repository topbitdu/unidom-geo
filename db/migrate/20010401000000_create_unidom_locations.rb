class CreateUnidomLocations < ActiveRecord::Migration

  def change

    create_table :unidom_locations, id: :uuid do |t|

      t.references :region, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.decimal :longitude, null: false, default: 0.0, precision: 10, scale: 6
      t.decimal :latitude,  null: false, default: 0.0, precision: 10, scale: 6

      t.string :postal_address, null: false, default: '', limit: 200
      t.string :postal_code,    null: false, default: '', limit: 20

      t.decimal :minimum_longitude, null: false, default: 0.0, precision: 10, scale: 6
      t.decimal :minimum_latitude,  null: false, default: 0.0, precision: 10, scale: 6
      t.decimal :maximum_longitude, null: false, default: 0.0, precision: 10, scale: 6
      t.decimal :maximum_latitude,  null: false, default: 0.0, precision: 10, scale: 6

      t.column :accuarcy_code, 'char(1)', null: false, default: 'N'

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_locations, :region_id
    add_index :unidom_locations, :latitude
    add_index :unidom_locations, :longitude
    add_index :unidom_locations, :minimum_latitude
    add_index :unidom_locations, :minimum_longitude
    add_index :unidom_locations, :maximum_latitude
    add_index :unidom_locations, :maximum_longitude
    add_index :unidom_locations, [ :postal_address, :region_id, :region_type ], unique: true, name: 'index_unidom_locations_on_postal_address_and_region'

  end

end
