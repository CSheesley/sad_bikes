class AddZipcodeToSearch < ActiveRecord::Migration[6.1]
  def change
    add_column :searches, :zipcode, :string
  end
end
