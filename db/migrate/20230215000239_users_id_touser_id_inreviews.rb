class UsersIdTouserIdInreviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :users_id, :user_id
  end
end
