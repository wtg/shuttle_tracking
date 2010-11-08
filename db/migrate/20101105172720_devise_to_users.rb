class DeviseToUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
    create_table :users do |t|
      t.cas_authenticatable
      t.trackable
    end
  end

  def self.down
    drop_table :users
    create_table "users" do |t|
      t.string   "username"
      t.string   "email"
      t.string   "crypted_password"
      t.string   "password_salt"
      t.string   "persistence_token"
      t.datetime "created_at"
      t.datetime "updated_at"
    end    
  end
end
