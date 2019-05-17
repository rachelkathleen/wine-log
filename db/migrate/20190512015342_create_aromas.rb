class CreateAromas < ActiveRecord::Migration[5.2]
  def change
    create_table :aromas do |t|
      t.string :aroma_name
      t.timestamps
    end
  end
end
