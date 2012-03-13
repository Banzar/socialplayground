class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :text
			t.string :name

      t.timestamps
    end
  end
end
