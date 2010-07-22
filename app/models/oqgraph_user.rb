class OqgraphUser < ActiveRecord::Base
    
  acts_as_oqgraph
  
  def friends
    self.outgoing_nodes
  end
  
  def network
    self.reachable
  end
end
