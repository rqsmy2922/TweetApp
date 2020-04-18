class RemovePlofileFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :plofile, :varchar
  end
end
