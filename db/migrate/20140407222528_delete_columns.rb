class DeleteColumns < ActiveRecord::Migration
  def change
    remove_column :lines, :station_id
    remove_column :stations, :line_id
  end
end
