class CreateWineAromas < ActiveRecord::Migration[5.2]
  def change
    create_table :wine_aromas do |t|
      t.integer :aroma_id
      t.integer :wine_id
      t.timestamps
    end
  end
end
