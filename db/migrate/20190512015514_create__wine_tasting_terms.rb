class CreateWineTastingTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :wine_tasting_terms do |t|
      t.integer :tasting_term_id
      t.integer :wine_id
      t.timestamps
    end
  end
end
