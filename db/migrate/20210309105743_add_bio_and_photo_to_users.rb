class AddBioAndPhotoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :photo, :string
  end
end
