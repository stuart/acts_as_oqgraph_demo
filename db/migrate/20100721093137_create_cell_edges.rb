class CreateCellEdges < ActiveRecord::Migration
  def self.up
    create_table :cell_edges do |t|
      t.integer :from_id
      t.integer :to_id
      t.float :weight 
    end
    
  end

  def self.down
    drop_table :cell_edges
  end
end
