class AddUserIdToPitches < ActiveRecord::Migration[5.0]
  def change
    add_reference :pitches, :user, foreign_key: true
  end
end
