class CreatePartyrelationships < ActiveRecord::Migration
  def self.up
    create_table :partyrelationships do |t|
      t.integer :principal_id
      t.integer :possession_id
      t.decimal :interest, :precision => 3, :scale => 3  # [precision.scale][3.3]

      t.timestamps
    end
  end

  def self.down
    drop_table :partyrelationships
  end
end
