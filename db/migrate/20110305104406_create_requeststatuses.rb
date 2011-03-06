class CreateRequeststatuses < ActiveRecord::Migration
  def self.up
    create_table :requeststatuses do |t|
      t.string :description

      t.timestamps
    end
    
    Requeststatus.create  :id => 1, :description => "new"
    Requeststatus.create  :id => 2, :description => "in process"
    Requeststatus.create  :id => 3, :description => "accepted"
    Requeststatus.create  :id => 4, :description => "rejected"
    
  end

  def self.down
    drop_table :requeststatuses
  end
end
