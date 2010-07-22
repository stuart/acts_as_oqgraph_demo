class CreateCells < ActiveRecord::Migration
  def self.up
    create_table :cells do |t|
      t.integer :x
      t.integer :y
      t.integer :maze_id 
    end
  end

  def self.down
    drop_table :cells
  end
end
