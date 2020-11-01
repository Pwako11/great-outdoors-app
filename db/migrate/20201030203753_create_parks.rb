class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :state
      t.string :description
      t.string :amenity
    end
  end
end
