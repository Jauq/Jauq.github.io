puts "Create new content."
print "Please type the subfolder's name for this content to be placed: "
folder = gets.chomp.downcase
puts "\nNext Select a theme, 0 - Home, 1 - Games, 2 - Music, 3 - Art, 4 - Misc"
print "If none is chosen Home will be default: "
theme = gets.chomp.to_i
if theme > 4
  theme = 0
end
themes = ["nHome", "nGames", "nMusic", "nArt", "nMisc"]
puts "\nNext we have title. If left blank a title will not be generated."
print "Type the title of this entry: "
title = gets.chomp
puts "\nNext we have subtitle. If left blank a subtitle will not be generated."
print "Type the subtitle of this entry: "
subtitle = gets.chomp
puts "\nNext we have footer. If left blank a footer will not be generated."
print "Type the footer of this entry: "
footer = gets.chomp
puts "\nNext we have content"
print "Type the full content of this entry: "
content = gets.chomp
puts "\nNext we have links. You can make as many links as necessary, but leaving the *key entry blank will stop this section and continue."
links = []
loop do
  print "Type the *key of the link: "
  temp = gets.chomp
  if temp == ""
    break
  end
  print "Type the text of the link: "
  temp += "-#{gets.chomp}"
  print "Type the actualy link: "
  temp += "-#{gets.chomp}"
  print "Type the target type (_blank, _self, etc): "
  temp += "-#{gets.chomp}"
  links.push(temp)
end
puts "\nNow the content entry will be generated."

prevEntryCount = Dir.glob("../content/#{folder}/*.txt").count
fileName = "#{"0" * (16 - prevEntryCount.to_s.length)}#{prevEntryCount}.txt"
File.open("../content/#{folder}/#{fileName}", "w+") do |f|
  f.puts("!" + themes[theme])
  if title != ""
    f.puts("@#{title}")
  end
  if subtitle != ""
    f.puts("##{subtitle}")
  end
  if footer != ""
    f.puts("$#{footer}")
  end
  links.each do |link|
    f.puts(link)
  end
  if content != ""
    f.puts(content)
  end
end

puts "Content Generated!"
print "Press enter to continue."
gets
