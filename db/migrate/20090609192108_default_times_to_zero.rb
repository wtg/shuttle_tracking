class DefaultTimesToZero < ActiveRecord::Migration
  def self.up
    change_column_default :routes, :start_time, '00:00'
    change_column_default :routes, :end_time, '00:00'
  end

  def self.down
  end
end
