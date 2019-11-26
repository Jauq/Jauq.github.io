require_relative "getFiles.rb"
requireRubyFiles("requires")

print "Relative path to html file for conversion to js format: "
filePath = gets.chomp
puts "Converting html to js..."

if filePath.include?(".html")
    filePath = filePath[0...filePath.length-5]
end

htmlPresetMaker(filePath)

endScript("Conversion")
