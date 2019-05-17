class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.integer :varietal_id
      t.integer :user_id
      t.string :producer
      t.string :wine_name
      t.string :type
      t.integer :country_id
      t.boolean :biodynamic
      t.boolean :organic
      t.date :date_added
      t.string :price_range
      t.integer :vintage
      t.integer :rating
      t.text :notes
      t.boolean :favorite
      t.timestamps
    end
  end
end
