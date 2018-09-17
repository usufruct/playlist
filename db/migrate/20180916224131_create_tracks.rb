class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.references :playlist, foreign_key: { on_delete: :cascade }

      t.string :name, null: false
      t.string :artist, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
