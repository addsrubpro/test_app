class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :party_id
      t.integer :accounttype_id
      t.integer :account_number
      t.decimal :charge_rate, :precision => 3, :scale => 3
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
