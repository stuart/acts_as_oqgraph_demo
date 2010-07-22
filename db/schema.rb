# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100721093137) do

  create_table "aans_users", :force => true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "lft"
    t.integer "rgt"
  end

  create_table "cell_edges", :force => true do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.float   "weight"
  end

  create_table "cell_oqgraph", :id => false, :force => true do |t|
    t.integer "latch",  :limit => 2
    t.integer "origid", :limit => 8
    t.integer "destid", :limit => 8
    t.float   "weight"
    t.integer "seq",    :limit => 8
    t.integer "linkid", :limit => 8
  end

  add_index "cell_oqgraph", ["latch", "destid", "origid"], :name => "latch_2"
  add_index "cell_oqgraph", ["latch", "origid", "destid"], :name => "latch"

  create_table "cells", :force => true do |t|
    t.integer "x"
    t.integer "y"
    t.integer "maze_id"
  end

  create_table "mazes", :force => true do |t|
    t.integer "width"
    t.integer "height"
  end

  create_table "oqgraph_user_edges", :force => true do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.float   "weight"
  end

  create_table "oqgraph_user_oqgraph", :id => false, :force => true do |t|
    t.integer "latch",  :limit => 2
    t.integer "origid", :limit => 8
    t.integer "destid", :limit => 8
    t.float   "weight"
    t.integer "seq",    :limit => 8
    t.integer "linkid", :limit => 8
  end

  add_index "oqgraph_user_oqgraph", ["latch", "destid", "origid"], :name => "latch_2"
  add_index "oqgraph_user_oqgraph", ["latch", "origid", "destid"], :name => "latch"

  create_table "oqgraph_users", :force => true do |t|
    t.string "first_name"
    t.string "last_name"
  end

end
