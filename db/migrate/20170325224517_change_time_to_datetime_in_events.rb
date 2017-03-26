class ChangeTimeToDatetimeInEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :date
  	change_column :events, :start_time, :datetime 
  	change_column :events, :end_time, :datetime 
  end
end
