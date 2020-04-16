class CreateFavoritePets < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_pets do |t|
      t.references :user, foreign_key: true
      t.string :pet_id
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
