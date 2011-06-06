
OqgraphUser.destroy_all
OqgraphUserEdge.destroy_all

puts "Creating 10000 random users."
10000.times do
  OqgraphUser.create(:first_name => Faker::Name.first_name,:last_name => Faker::Name.last_name)
end

puts "Linking users to 0 - 9 other users"
OqgraphUser.all.each do |user|
  others = (OqgraphUser.all - [user]).sample(rand(10))
  others.each do |other|
    user.create_edge_to(other)
  end

end

puts "Creating a maze 20 x 20"
m = Maze.create(:width => 20, :height => 20)
m.save
puts "Generating the maze..please wait"
m.generate
