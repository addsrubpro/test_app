class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.integer :applicationstatus_id
      t.date :status_date
      t.integer :payment_account
      t.string :name
      t.string :street
      t.integer :country_id
      t.integer :account_number
      t.integer :accounttype_id

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
