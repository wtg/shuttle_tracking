class AddFrontpageFlagToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :frontpage, :boolean
  end

  def self.down
    remove_column :pages, :frontpage
  end
end
