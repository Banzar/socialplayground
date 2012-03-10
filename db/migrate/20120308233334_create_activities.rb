class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
			t.string :state
			t.string :county
			t.integer :reported

      t.timestamps
    end
  end
end
