class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :description
      t.timestamps
    end
    Country.create  :description => "Albania"
    Country.create  :description => "Andorra"
    Country.create  :description => "Armenia"
    Country.create  :description => "Austria"
    Country.create  :description => "Azerbaijan"
    Country.create  :description => "Belarus"
    
  end

  def self.down
    drop_table :countries
  end
end
