class ChangeTypePaymentIbanInParties < ActiveRecord::Migration
  def self.up
    change_column :parties, :payment_iban, :string, :limit => 40
  end

  def self.down
  end
end
