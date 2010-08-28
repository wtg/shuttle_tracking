class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
	    t.text     :message
	    t.timestamps
	    t.integer  :code
	    t.boolean  :public, :default => true
    end
  end

  def self.down
  	drop_table :statuses
  end
end
