class AddNameAndDisplayNameAndProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :display_name, :string
    add_column :users, :profile, :string
  end
end
