class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
