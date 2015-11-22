class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :region
      t.string :country
      t.timestamps
    end
  end
end
