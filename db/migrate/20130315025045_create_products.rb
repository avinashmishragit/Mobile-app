class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :companyName
      t.text :Address
      t.string :webAddress

      t.timestamps
    end
  end
end
