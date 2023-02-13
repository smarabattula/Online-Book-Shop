class AddKeysToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :user, null: false, foreign_key: true
    add_reference :transactions, :book, null: false, foreign_key: true
  end
end
