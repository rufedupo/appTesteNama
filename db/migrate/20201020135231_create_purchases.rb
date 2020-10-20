class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :buyer
      t.references :product
      t.integer :quantity
      t.references :provider

      t.timestamps
    end
  end
end
