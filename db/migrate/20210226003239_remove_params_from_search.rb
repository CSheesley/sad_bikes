class RemoveParamsFromSearch < ActiveRecord::Migration[6.1]
  def change
    remove_column :searches, :params
  end
end
