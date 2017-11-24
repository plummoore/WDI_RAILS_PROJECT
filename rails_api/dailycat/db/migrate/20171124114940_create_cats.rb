class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :giphy_image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
