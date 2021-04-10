class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
