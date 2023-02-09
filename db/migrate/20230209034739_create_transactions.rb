class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :quantity
      t.decimal :total_price

      t.timestamps
    end
  end
end
