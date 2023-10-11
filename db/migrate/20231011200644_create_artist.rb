class CreateArtist < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :year_born
      t.string :country
      t.boolean :alive

      t.timestamps
    end
  end
end
