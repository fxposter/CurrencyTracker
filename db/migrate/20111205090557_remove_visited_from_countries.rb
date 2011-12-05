class RemoveVisitedFromCountries < ActiveRecord::Migration
  def self.up
    remove_column :countries, :visited
  end

  def self.down
    add_column :countries, :visited, :boolean, :default => false
  end
end
