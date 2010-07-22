class CreateAansUsers < ActiveRecord::Migration
  def self.up
    create_table :aans_users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :lft
      t.integer :rgt
      t.intger  :parent_id 
    end
  end

  def self.down
    drop_table :aans_users
  end
end
