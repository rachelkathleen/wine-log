class CreateWineAromas < ActiveRecord::Migration[5.2]
  def change
    create_table :aroma_posts do |t|
      t.integer :aroma_id
      t.integer :wine_id
      t.timestamps
    end
  end
end
