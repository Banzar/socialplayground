class AddFullNameToKids < ActiveRecord::Migration
  def change
    add_column :kids, :full_name, :string
  end
end
