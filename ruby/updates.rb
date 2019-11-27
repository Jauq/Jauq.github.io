require_relative "getFiles.rb"
requireRubyFiles("requires")

puts "Updating Script. What would you like to update?\n"
puts "[1] newindex"
puts "[2] games"
puts "[3] presets"

print "\nType the id of what you want to update:  "
input = gets.chomp.to_i
update = true
if input == 1
  puts "Updating newIndex.html..."
  updateIndex("newIndex.html")
elsif input == 2
  puts "Updating games.html..."
  updateGames
elsif input == 3
  puts "Updating all presets..."
  files = getFiles("../presets", "html")
  files.each do |f|
    htmlPresetMaker(f[0...f.length-5])
  end
else
  puts "Unknown thing to update."
  update = false
  gets
end
if update
  endScript
end
