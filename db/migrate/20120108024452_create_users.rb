class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 	:first_name
      t.string 	:last_name
      t.string 	:email
      t.string  :password_hash
      t.string 	:password_salt
      t.text 		:about_us
			t.string  :address
      t.string  :county
      t.string 	:state
      t.integer :zip_code
			t.string  :username
			t.date		:birthday

      t.timestamps
    end
  end
end
