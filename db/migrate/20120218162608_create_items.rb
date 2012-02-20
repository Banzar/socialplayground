class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
