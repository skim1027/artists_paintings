class CreatePainting < ActiveRecord::Migration[7.0]
  def change
    create_table :paintings do |t|
      t.string :name
      t.integer :year_painted
      t.boolean :oil_painting

      t.timestamps
    end
  end
end
