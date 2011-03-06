class CreateTitles < ActiveRecord::Migration
  def self.up
    create_table :titles do |t|
      t.string :description

      t.timestamps
    end
    Title.create  :id => 1, :description => "Mr."
    Title.create  :id => 1, :description => "Ms."
  end

  def self.down
    drop_table :titles
  end
end
