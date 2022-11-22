class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.float :price_day
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :language
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
