class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :photos, [:user_id, :created_at]
  end
end
