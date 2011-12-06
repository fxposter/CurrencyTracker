class CreateVisitsAgain < ActiveRecord::Migration
  def self.up
    add_column :visits, :id, :primary_key
    change_table :visits do |t|
      t.timestamps
    end
  end

  def self.down
    remove_column :visits, :id
    remove_column :visits, :created_at
    remove_column :visits, :updated_at
  end
end
