class DropTableFriendships < ActiveRecord::Migration
  def self.up
		drop_table :friendships
  end

  def self.down
  end
end
