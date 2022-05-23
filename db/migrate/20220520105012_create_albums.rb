class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.string :spotify_id, null: false
      t.string :image
      t.string :spotify_url, null: false
      t.date :release_date, null: false
      t.string :type, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
