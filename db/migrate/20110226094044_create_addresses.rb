class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :party_id
      t.string :street
      t.string :city
      t.integer :country_id
      t.date :valid_since

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
