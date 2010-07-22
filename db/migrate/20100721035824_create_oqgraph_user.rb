class CreateOqgraphUser < ActiveRecord::Migration
  def self.up
    create_table :oqgraph_users do |t|
      t.string :first_name
      t.string :last_name
    end
  end

  def self.down
    drop_table :oqgraph_users
  end
end
