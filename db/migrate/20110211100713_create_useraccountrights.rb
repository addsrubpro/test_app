class CreateUseraccountrights < ActiveRecord::Migration
  def self.up
    create_table :useraccountrights do |t|
      t.integer :useraccount_id
      t.integer :right_id

      t.timestamps
    end
  end

  def self.down
    drop_table :useraccountrights
  end
end
