class CreateUseraccounts < ActiveRecord::Migration
  def self.up
    create_table :useraccounts do |t|
      t.string :username
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :useraccounts
  end
end
