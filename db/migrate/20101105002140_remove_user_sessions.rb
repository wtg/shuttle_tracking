class RemoveUserSessions < ActiveRecord::Migration
  def self.up
    drop_table :user_sessions
  end

  def self.down
    create_table :user_sessions do |t|

      t.timestamps
    end
  end
end
