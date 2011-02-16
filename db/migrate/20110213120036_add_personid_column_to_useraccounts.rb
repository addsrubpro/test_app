class AddPersonidColumnToUseraccounts < ActiveRecord::Migration
  def self.up
    add_column :useraccounts, :person_id, :integer
  end

  def self.down
    remove_column :useraccounts, :person_id
  end
end
