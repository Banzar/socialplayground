class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :event_description
      t.date :date
      t.string :start_time
      t.datetime :created_at
      t.integer :user_id
			t.integer :id
      t.timestamps
    end
  end
end
