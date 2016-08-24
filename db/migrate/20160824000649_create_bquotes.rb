class CreateBquotes < ActiveRecord::Migration
  def change
    create_table :bquotes do |t|
      t.text :content
      t.string :citation
      t.string :section

      t.timestamps null: false
    end
    add_index :bquotes, :section
  end
end
