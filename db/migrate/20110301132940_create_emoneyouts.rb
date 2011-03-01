class CreateEmoneyouts < ActiveRecord::Migration
  def self.up
    create_table :emoneyouts do |t|
      t.date :clearing_date
      t.integer :transaction_id
      t.timestamps
    end
    add_index :emoneyouts, :clearing_date
    add_index :emoneyouts, :transaction_id
  end

  def self.down
    drop_table :emoneyouts
  end
end