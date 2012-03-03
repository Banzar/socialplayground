class AddViewedToMessageCopies < ActiveRecord::Migration
  def change
    add_column :message_copies, :viewed, :boolean
  end
end
