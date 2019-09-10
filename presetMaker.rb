print "Relative path to html file for conversion: "
filePath = gets.chomp

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

File.write("#{filePath}.js", newData.join("\n"), mode: "a")