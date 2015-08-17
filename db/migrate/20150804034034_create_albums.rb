class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.column :title, :string
      t.column :artist, :string
      t.column :format, :string

      t.timestamps
    end
  end
end
