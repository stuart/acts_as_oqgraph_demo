class Cell < ActiveRecord::Base
  acts_as_oqgraph
  
  belongs_to :maze
    
  def neighbours
    [north, south, east, west]
  end
  
  def north
    maze.cells.find(:first, :conditions => {:x => x, :y => y-1})
  end
  
  def south
    maze.cells.find(:first, :conditions => {:x => x, :y => y+1})
  end
  
  def east
    maze.cells.find(:first, :conditions => {:x => x+1, :y => y})
  end
  
  def west
    maze.cells.find(:first, :conditions => {:x => x-1, :y => y})
  end
  
  def can_go_north
    outgoing_nodes.include?(north)
  end
  
  def can_go_south
    outgoing_nodes.include?(south)
  end
  
  def can_go_east
    outgoing_nodes.include?(east)
  end
  
  def can_go_west
    outgoing_nodes.include?(west)
  end
  
  def css_classes(current_cell)
    classes = []
    classes += ['north'] if !can_go_north
    classes += ['south'] if !can_go_south
    classes += ['east'] if !can_go_east
    classes += ['west'] if !can_go_west
    classes += ['solution'] if in_solution?
    classes += ['inpath'] if in_path_from?(current_cell)
    classes += ['current'] if self == current_cell
    return classes.join(' ')
  end
  
  def in_path_from?(other_cell)
    other_cell.shortest_path_to(maze.cells.last).include?(self)
  end
  
  def in_solution?
    maze.solution.include?(self)
  end
  
  def cells_within(distance)
    maze.cells.find(:all, :conditions => ["maze_id = :maze_id AND x BETWEEN :x_min AND :x_max AND y BETWEEN :y_min AND :y_max",
      {:maze_id => maze_id, :x_min => x - distance, :x_max => x + distance, :y_min => y - distance, :y_max => y + distance}] )
  end
  
  def visible
    v = cells_within(5)
  end
end