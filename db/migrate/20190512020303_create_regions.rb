class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.string :region_name
      t.integer :country_id
      t.timestamps
    end
  end
end
