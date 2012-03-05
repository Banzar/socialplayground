class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :age
      t.string :school
      t.string :hobbies
      t.string :grade
			t.integer :user_id
			t.date	:birthday

      t.timestamps
    end
  end
end
