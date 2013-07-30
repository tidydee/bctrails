class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :postal_code
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps
      t.integer :user_id

      t.timestamps
    end
  end
end
