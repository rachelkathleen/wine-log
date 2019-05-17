class CreateTastingTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :tasting_terms do |t|
      t.string :term
      t.string :definition
      t.timestamps
    end
  end
end
