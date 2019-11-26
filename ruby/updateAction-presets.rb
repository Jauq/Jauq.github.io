require_relative "getFiles.rb"
requireRubyFiles("requires")

puts "Updating all presets..."

files = getFiles("../presets", "html")

files.each do |f|
  htmlPresetMaker(f[0...f.length-5])
end

endScript
