class CreateAccounttypes < ActiveRecord::Migration
  def self.up
    create_table :accounttypes do |t|
      t.string :description
      t.decimal :default_charge_rate, :precision => 2, :scale => 4   # 99.9999

      t.timestamps
    end
    Accounttype.create  :id => 1,
                        :description => "consumer e-money account",
                        :default_charge_rate => 0
    Accounttype.create  :id => 2,
                        :description => "merchant e-money account",
                        :default_charge_rate => 0.01
  end

  def self.down
    drop_table :accounttypes
  end
end
