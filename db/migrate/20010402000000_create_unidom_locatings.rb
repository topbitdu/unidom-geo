class CreateUnidomLocatings < ActiveRecord::Migration

  def change

    create_table :unidom_locatings, id: :uuid do |t|

      t.references :location, type: :uuid, null: false
      t.references :located,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :locator,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_locatings, :location_id
    add_index :unidom_locatings, :located_id
    add_index :unidom_locatings, :locator_id

  end

end
