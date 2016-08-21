class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string 		:title,			null: false
    	t.date 			:date,			null: false
    	t.time 			:start_time,	null: false
    	t.time 			:end_time
    	t.text			:location,		null: false
    	t.text			:description
     	t.timestamps				null: false
    end
  end
end