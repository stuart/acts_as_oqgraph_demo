class Maze < ActiveRecord::Base
  has_many :cells
  
  attr_accessor :solution
  
  # Generate using Kruskal's method 
  # O(N) complexity.
  def generate
    cells.destroy_all
    
    x = 0
    while x < width do
      y = 0
      while y < height do
        cells.create(:x => x, :y => y)
        y += 1
      end
      x += 1
    end
    
    # A wall is like this: [cell1,cell2]
    walls = []
    
    cells.each do |cell|
      walls += ([cell]*4).zip(cell.neighbours)
    end
    
    walls.shuffle!
    
    walls.each do |cell, neighbour|
      cell.create_edge_to_and_from(neighbour) unless neighbour.nil? || cell.reachable?(neighbour)
    end
    
    @solution ||= cells.first.shortest_path_to(cells.last)
  end
  
  # This is where OQGraph engine does it's fast magic.
  def solution
    @solution ||= cells.first.shortest_path_to(cells.last)
  end
  
end