class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :line_id

      t.timestamps
    end

    create_table :lines do |t|
      t.string :name
      t.integer :station_id

      t.timestamps
    end

    create_table :stops do |t|
      t.integer :station_id
      t.integer :line_id

      t.timestamps
    end
  end
end
