class AddAttributesToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :housenumber, :string
    add_column :addresses, :postal_supplement, :string
    add_column :addresses, :zipcode, :string
    add_index :addresses, :party_id
  end

  def self.down
    remove_column :addresses, :zipcode
    remove_column :addresses, :postal_supplement
    remove_column :addresses, :housenumber
  end
end
