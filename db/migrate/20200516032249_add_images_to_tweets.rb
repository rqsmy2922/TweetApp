class AddImagesToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :images, :string
  end
end
