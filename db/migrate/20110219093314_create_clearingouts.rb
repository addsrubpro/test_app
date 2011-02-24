class CreateClearingouts < ActiveRecord::Migration
  def self.up
    create_table :clearingouts do |t|
      t.date :clearing_date
      t.integer :transaction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clearingouts
  end
end
