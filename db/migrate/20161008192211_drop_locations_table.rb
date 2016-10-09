class DropLocationsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :location
    create_table :locations do |t|
      t.string   "city"
      t.string   "state"
      t.string   "country"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
