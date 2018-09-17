class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.references :user, foreign_key: { on_delete: :cascade }
      t.string :name, null: false

      t.timestamps
    end
  end
end
