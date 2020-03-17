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

def updateIndex(filePath = "/Jauq.github.io/index.html")

  files = getFiles("/Jauq.github.io/content/home")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/Jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"homeBgDeco\">"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/indexJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/Jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def updateGames(filePath = "/Jauq.github.io/views/games.html")

  files = getFiles("/Jauq.github.io/content/games")
  files = files.reverse

  $gamesGenres = getFileLines("/Jauq.github.io/content/gamesGenres.txt")

  ($gamesGenres.count + 1).times do |n|

    filePath = "/Jauq.github.io/views/games/genres/#{$gamesGenres[n - 1].to_s.downcase}.html" if n >= 1

    $f = []

    $f.push("<!doctype html>")
    $f.push("<html lang=\"en\">"); hn
    $f.push("   <script src=\"/Jauq.github.io/presets/head.js\"></script>"); hn
    $f.push("   <body class=\"gamesBgDeco\">"); hn
    $f.push("     <script src=\"/Jauq.github.io/presets/gamesJumbo.js\"></script>"); hn
    $f.push("     <script src=\"/Jauq.github.io/presets/navbar.js\"></script>"); hn
    $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
    cm("Main Section")
    $f.push("       <div class=\"container\">"); hn
    if n == 0
      files.each do |paths|
        genMediaContent($f, paths); hn
      end
    elsif n >= 1
      files.each do |paths|
        genMediaContent($f, paths, $gamesGenres[n - 1]); hn
      end
    end
    $f.push("       </div>")
    cm("Main Section", true); hn
    $f.push("       <script src=\"/Jauq.github.io/presets/footer.js\"></script>"); hn
    $f.push("     </div>"); hn
    $f.push("     <script src=\"/Jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
    $f.push("     <script src=\"/Jauq.github.io/scripts/footerYear.js\"></script>"); hn
    $f.push("   </body>")
    $f.push("</html>")

    File.new("#{filePath}", "w+")
    File.write("#{filePath}", $f.join("\n"), mode: "a")

  end

  files.each do |paths|

    content = getFileLines(paths)

    temp = content.index { |x| x.start_with?("@") }
    header = nil
    if temp != nil
      header = content[temp]
      header = header[1...header.length]
      content.delete_at(temp)
    end

    filePath = "/Jauq.github.io/views/games/#{header}.html"

    $f = []

    $f.push("<!doctype html>")
    $f.push("<html lang=\"en\">"); hn
    $f.push("   <script src=\"/Jauq.github.io/presets/head.js\"></script>"); hn
    $f.push("   <body class=\"gamesBgDeco\">"); hn
    $f.push("     <script src=\"/Jauq.github.io/presets/gamesJumbo.js\"></script>"); hn
    $f.push("     <script src=\"/Jauq.github.io/presets/navbar.js\"></script>"); hn
    $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
    cm("Main Section")
=begin
    $f.push("       <div class=\"container\">"); hn
    if n == 0
      files.each do |paths|
        genMediaContent($f, paths); hn
      end
    elsif n >= 1
      files.each do |paths|
        genMediaContent($f, paths, $gamesGenres[n - 1]); hn
      end
    end
    $f.push("       </div>")
=end
    cm("Main Section", true); hn
    $f.push("       <script src=\"/Jauq.github.io/presets/footer.js\"></script>"); hn
    $f.push("     </div>"); hn
    $f.push("     <script src=\"/Jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
    $f.push("     <script src=\"/Jauq.github.io/scripts/footerYear.js\"></script>"); hn
    $f.push("   </body>")
    $f.push("</html>")

    File.new("#{filePath}", "w+")
    File.write("#{filePath}", $f.join("\n"), mode: "a")

  end

end

def updateMusic(filePath = "/Jauq.github.io/views/music.html")

  files = getFiles("/Jauq.github.io/content/music")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/Jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"musicBgDeco\">"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/musicJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/Jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def updateArt(filePath = "/Jauq.github.io/views/art.html")

  files = getFiles("/Jauq.github.io/content/art")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/Jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"artBgDeco\">"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/artJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/Jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def updateMisc(filePath = "/Jauq.github.io/views/misc.html")

  files = getFiles("/Jauq.github.io/content/misc")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/Jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"miscBgDeco\">"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/miscJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/Jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end

def update404(filePath = "/Jauq.github.io/404.html")

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"/Jauq.github.io/presets/head.js\"></script>"); hn
  $f.push("   <body class=\"homeBgDeco\">"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/indexJumbo.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn

  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  genContent($f, "/Jauq.github.io/content/404block.txt"); hn
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"/Jauq.github.io/presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"/Jauq.github.io/scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("#{filePath}", "w+")
  File.write("#{filePath}", $f.join("\n"), mode: "a")

end
