class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits, :id => false do |t|
      t.integer :user_id
      t.string :country_code
    end
    add_index :visits, [:user_id, :country_code], :unique => true
  end

  def self.down
    drop_table :visits
  end
end
