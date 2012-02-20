class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.text :message
      t.datetime :create_at

      t.timestamps
    end
  end
end
