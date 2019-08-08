class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
