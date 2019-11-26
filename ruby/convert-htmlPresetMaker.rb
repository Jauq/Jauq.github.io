print "Relative path to html file for conversion to js script format: "
filePath = gets.chomp
puts "Converting html..."

if filePath.include?(".html")
    filePath = filePath[0..filePath.length-6]
end

currentPath = File.dirname(__FILE__)

fileData = File.read("#{currentPath}\\#{filePath}.html").split("\n")

newData = []

fileData.count.times do |z|
    newData.push("#{fileData[z]}\\")
end

newData.insert(0, "document.write('\\")

newData.push("');")

#puts newData
File.new("#{filePath}.js", "w+")
File.write("#{filePath}.js", newData.join("\n"), mode: "a")

puts "Conversion Successful!"
print "Press enter to continue."
gets
