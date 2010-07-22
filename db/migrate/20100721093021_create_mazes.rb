class CreateMazes < ActiveRecord::Migration
  def self.up
    create_table :mazes do |t|
      t.integer :width
      t.integer :height
    end 
  end

  def self.down
    drop_table :mazes
  end
end
