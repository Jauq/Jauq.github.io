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

def shrinkFilePathForID(filePath)
  id = filePath.split("/")
  id = id[-1].split(".")
  id = id[0]
  return id
end

def organizeContentFiles(files)
  #files should be an array of strings where each string is the filepath to the content in question.
  #This hash will help identify the id number of the content
  sortHash = {}
  files.each do |file|
    #First the filepath is split by slashes
    file = file.split("/")
    #Since content text file needs to be the last thing, this splits the last part of the filepath by the .
    file[-1] = file[-1].split(".")
    #Setting temporary variable to the interger version of the content id
    temp = file[-1][0].to_i
    #Next I rejoin the id number and txt with a .
    file[-1] = file[-1].join(".")
    #Lastly the sortHash sets a key with the integer id, then sets the value to the whole filepath string again
    sortHash[temp] = file.join("/")
  end
  #The sorthash is then sorted, becoming a nested array
  sortHash = sortHash.sort
  #A new array is created to hold the final sorted filepath array
  newArray = []
  sortHash.each do |key|
    #we only want the string, not the id, the id was only for sorting
    newArray.push(key[1])
  end
  #finally, reverse the array so that the biggest number (newest content) shows up on top
  newArray = newArray.reverse
  #puts newArray
  return newArray
end

def updateIndex(filePath = "/JauqGames.github.io/index.html")

  files = getFiles("/JauqGames.github.io/content/home")
  files = organizeContentFiles(files)

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/JauqGames.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"homeBgDeco\">"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/indexJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/JauqGames.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end


#Here, all the games pages get updated. Most of the commented out stuff is for a special type of content box specifically made for games. It's a lot of work and well, I'll get to it eventually.
#First comment is for making a page for each game genre.
#First block comment is for generating the games on those pages using my special "genMediaContent" method.
#Second block comment is generating individual pages for each Game.
def updateGames(filePath = "/JauqGames.github.io/views/games.html")

  files = getFiles("/JauqGames.github.io/content/games")
  files = organizeContentFiles(files)

  $gamesGenres = getFileLines("/JauqGames.github.io/content/gamesGenres.txt")

  #($gamesGenres.count + 1).times do |n|
  1.times do |n|

    filePath = "/JauqGames.github.io/views/games/genres/#{$gamesGenres[n - 1].to_s.downcase}.html" if n >= 1

    $f = []

    $f.push("<!doctype html>")
    $f.push("<html lang=\"en\">"); hn
    $f.push("   <script src=\"/JauqGames.github.io/presets/head.js\"></script>"); hn
    $f.push("   <body class=\"gamesBgDeco\">"); hn
    $f.push("     <script src=\"/JauqGames.github.io/presets/gamesJumbo.js\"></script>"); hn
    $f.push("     <script src=\"/JauqGames.github.io/presets/navbar.js\"></script>"); hn
    $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
    cm("Main Section")
    $f.push("       <div class=\"container\">"); hn
    files.each do |contents|
      genContent($f, contents); hn
    end
=begin
    if n == 0
      files.each do |paths|
        genMediaContent($f, paths); hn
      end
    elsif n >= 1
      files.each do |paths|
        genMediaContent($f, paths, $gamesGenres[n - 1]); hn
      end
    end
=end
    $f.push("       </div>")
    cm("Main Section", true); hn
    $f.push("       <script src=\"/JauqGames.github.io/presets/footer.js\"></script>"); hn
    $f.push("     </div>"); hn
    $f.push("     <script src=\"/JauqGames.github.io/scripts/navbarSticky.js\"></script>"); hn
    $f.push("     <script src=\"/JauqGames.github.io/scripts/footerYear.js\"></script>"); hn
    $f.push("   </body>")
    $f.push("</html>")

    File.new("#{filePath}", "w+")
    File.write("#{filePath}", $f.join("\n"), mode: "a")

  end

=begin
  files.each do |paths|

    content = getFileLines(paths)

    temp = content.index { |x| x.start_with?("@") }
    header = nil
    if temp != nil
      header = content[temp]
      header = header[1...header.length]
      content.delete_at(temp)
    end

    filePath = "/JauqGames.github.io/views/games/#{header}.html"

    $f = []

    $f.push("<!doctype html>")
    $f.push("<html lang=\"en\">"); hn
    $f.push("   <script src=\"/JauqGames.github.io/presets/head.js\"></script>"); hn
    $f.push("   <body class=\"gamesBgDeco\">"); hn
    $f.push("     <script src=\"/JauqGames.github.io/presets/gamesJumbo.js\"></script>"); hn
    $f.push("     <script src=\"/JauqGames.github.io/presets/navbar.js\"></script>"); hn
    $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
    cm("Main Section")

    cm("Main Section", true); hn
    $f.push("       <script src=\"/JauqGames.github.io/presets/footer.js\"></script>"); hn
    $f.push("     </div>"); hn
    $f.push("     <script src=\"/JauqGames.github.io/scripts/navbarSticky.js\"></script>"); hn
    $f.push("     <script src=\"/JauqGames.github.io/scripts/footerYear.js\"></script>"); hn
    $f.push("   </body>")
    $f.push("</html>")

    File.new("#{filePath}", "w+")
    File.write("#{filePath}", $f.join("\n"), mode: "a")

  end
=end

end

def updateMusic(filePath = "/JauqGames.github.io/views/music.html")

  files = getFiles("/JauqGames.github.io/content/music")
  files = organizeContentFiles(files)

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/JauqGames.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"musicBgDeco\">"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/musicJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/JauqGames.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def updateArt(filePath = "/JauqGames.github.io/views/art.html")

  files = getFiles("/JauqGames.github.io/content/art")
  files = organizeContentFiles(files)

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/JauqGames.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"artBgDeco\">"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/artJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/JauqGames.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def updateMisc(filePath = "/JauqGames.github.io/views/misc.html")

  files = getFiles("/JauqGames.github.io/content/misc")
  files = organizeContentFiles(files)

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/JauqGames.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"miscBgDeco\">"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/miscJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/JauqGames.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def update404(filePath = "/JauqGames.github.io/404.html")

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/JauqGames.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"homeBgDeco\">"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/indexJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn

  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  genContent($f, "/JauqGames.github.io/content/404block.txt"); hn
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/JauqGames.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def updateInfo(filePath = "/JauqGames.github.io/info.html")

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/JauqGames.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"homeBgDeco\">"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/miscJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn

  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  genContent($f, "/JauqGames.github.io/content/aboutBlock.txt"); hn
  genContent($f, "/JauqGames.github.io/content/contactBlock.txt"); hn
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/JauqGames.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/JauqGames.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end
