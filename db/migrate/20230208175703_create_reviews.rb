class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :Rating
      t.string :Review

      t.timestamps
    end
  end
end
