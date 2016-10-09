class AddDiversityColumnstoUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ethnicity, :string
    add_column :users, :orientation, :string
  end
end
