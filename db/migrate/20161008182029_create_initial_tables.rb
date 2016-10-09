class CreateInitialTables < ActiveRecord::Migration[5.0]
  def change
  #users table
    add_column :users, :name, :string
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :bio, :text
    add_column :users, :img, :text
    add_column :users, :email, :string
    add_column :users, :location, :string
    add_column :users, :area_of_interest, :string
    add_column :users, :years_of_expertise, :string
    add_column :users, :past_employment, :string
    add_column :users, :twitter_link, :string
    add_column :users, :linked_in_link, :string
    add_column :users, :github_link, :string
    add_column :users, :facebook_link, :string
    add_column :users, :admin, :boolean
    add_column :users, :web_developer, :boolean
    add_column :users, :project_mgmt, :boolean
    add_column :users, :marketing, :boolean
    add_column :users, :ux_ui, :boolean
    add_column :users, :data_analytics, :boolean
    add_column :users, :human_resources, :boolean
    add_column :users, :finance, :boolean
    add_column :users, :business_development, :boolean
    add_column :users, :other, :text


#location table
    create_table :location do |t|
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end

#pitches table
    add_column :pitches, :title, :string
    add_column :pitches, :description, :string
    add_column :pitches, :category, :string
    add_column :pitches, :looking_for, :string
#boards
    add_column :boards, :owners, :string
    add_column :boards, :category, :string
    add_column :boards, :title, :string
#posts
    add_column :posts, :title, :string
    add_column :posts, :content, :string
    add_reference :posts, :user, foreign_key: true
    add_reference :posts, :board, foreign_key: true
#comments
    add_column :comments, :content, :string
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :post, foreign_key: true


#feedback
    add_column :feedbacks, :content, :string
    add_reference :feedbacks, :user, foreign_key: true
    add_reference :feedbacks, :pitch, foreign_key: true
  end
end
