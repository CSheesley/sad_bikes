class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.text :params
      t.text :response_json

      t.timestamps
    end
  end
end
