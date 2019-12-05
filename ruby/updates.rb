require_relative "getFiles.rb"
requireRubyFiles("requires")

puts "Updating Script. What would you like to update?\n"
puts "[1] newindex"
puts "[2] games"
puts "[3] music"
puts "[4] art"
puts "[5] misc"
puts "[6] presets"
puts "[7] 404 page"
puts "[8] all"

print "\nType the id of what you want to update:  "
input = gets.chomp.to_i
update = true
if input == 1
  puts "Updating newindex.html..."
  updateIndex("../newindex.html")
elsif input == 2
  puts "Updating games.html..."
  updateGames
elsif input == 3
  puts "Updating music.html..."
  updateMusic
elsif input == 4
  puts "Updating art.html..."
  updateArt
elsif input == 5
  puts "Updating misc.html..."
  updateMisc
elsif input == 6
  puts "Updating all presets..."
  files = getFiles("../presets", "html")
  files.each do |f|
    htmlPresetMaker(f[0...f.length-5])
  end
elsif input == 7
  puts "Updating 404 page..."
  update404
elsif input == 8
  puts "Updating newindex.html..."
  updateIndex("../newindex.html")
  puts "Updating games.html..."
  updateGames
  puts "Updating music.html..."
  updateMusic
  puts "Updating art.html..."
  updateArt
  puts "Updating misc.html..."
  updateMisc
  puts "Updating all presets..."
  files = getFiles("../presets", "html")
  files.each do |f|
    htmlPresetMaker(f[0...f.length-5])
  end
  puts "Updating 404 page..."
  update404
else
  puts "Unknown thing to update."
  update = false
  gets
end
if update
  endScript
end
