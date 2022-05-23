class RenameTypeColumnToAlbums < ActiveRecord::Migration[7.0]
  def change
    rename_column :albums, :type, :format_type
  end
end
