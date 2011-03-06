class AddAttributesToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :title_id, :integer
    add_column :people, :degree, :string
    add_column :people, :first_name, :string
    add_column :people, :middle_name, :string
    add_column :people, :last_name, :string
    add_column :people, :email, :string
    add_column :people, :telephone, :string
    add_column :people, :birth_date, :date
    add_column :people, :birth_place, :string
    
    add_index :people, :party_id
    add_index :people, :email
  end

  def self.down
    remove_column :people, :birth_place
    remove_column :people, :birth_date
    remove_column :people, :telephone
    remove_column :people, :email
    remove_column :people, :last_name
    remove_column :people, :middle_name
    remove_column :people, :first_name
    remove_column :people, :degree
    remove_column :people, :title_id
  end
end
