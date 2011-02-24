class CreateEmoneyoutstandings < ActiveRecord::Migration
  def self.up
    create_table :emoneyoutstandings do |t|
      t.decimal :amount
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :emoneyoutstandings
  end
end
