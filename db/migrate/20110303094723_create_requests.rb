class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.integer :requeststatus_id
      t.date :requeststatus_date
      t.string :payment_iban
      t.integer :title_id
      t.string :degree
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :telephone
      t.date :birth_date
      t.string :birth_place
      t.string :street
      t.string :housenumber
      t.string :postal_supplement
      t.string :zipcode
      t.string :city
      t.integer :country_id
      t.integer :accounttype_id

      t.timestamps
    end
    add_index :requests, :requeststatus_id
  end

  def self.down
    drop_table :requests
  end
end
