class RenameColumnInParties < ActiveRecord::Migration
  def self.up
    rename_column :parties, :payment_account, :payment_iban
    add_index :parties, :payment_iban
  end

  def self.down
  end
end