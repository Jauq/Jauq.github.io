def htmlPresetMaker(filePath)

  fileData = File.read("#{filePath}.html").split("\n")

  newData = []

  fileData.count.times do |z|
      newData.push("#{fileData[z]}\\")
  end

  newData.insert(0, "document.write('\\")

  newData.push("');")

  File.new("#{filePath}.js", "w+")
  File.write("#{filePath}.js", newData.join("\n"), mode: "a")

end
