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

def updateIndex(filePath = "index.html")

  files = getFiles("../content/home")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"presets/head.js\"></script>"); hn
  $f.push("   <body class=\"homeBgDeco\">"); hn
  $f.push("     <script src=\"presets/indexJumbo.js\"></script>"); hn
  $f.push("     <script src=\"presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  files.each do |contents|
    genContent($f, contents); hn
  end
  $f.push("       </div>")
  cm("Main Section", true); hn
  $f.push("       <script src=\"presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("../#{filePath}", "w+")
  File.write("../#{filePath}", $f.join("\n"), mode: "a")

end

def updateGames(filePath = "views/games.html")

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"../presets/viewsHead.js\"></script>"); hn
  $f.push("   <body class=\"gamesBgDeco\">"); hn
  $f.push("     <script src=\"../presets/gamesJumbo.js\"></script>"); hn
  $f.push("     <script src=\"../presets/viewsNavbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")

  cm("Main Section", true); hn
  $f.push("       <script src=\"../presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"../scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"../scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("../#{filePath}", "w+")
  File.write("../#{filePath}", $f.join("\n"), mode: "a")

end

def updateMusic(filePath = "views/music.html")

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"../presets/viewsHead.js\"></script>"); hn
  $f.push("   <body class=\"musicBgDeco\">"); hn
  $f.push("     <script src=\"../presets/musicJumbo.js\"></script>"); hn
  $f.push("     <script src=\"../presets/viewsNavbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")

  cm("Main Section", true); hn
  $f.push("       <script src=\"../presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"../scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"../scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("../#{filePath}", "w+")
  File.write("../#{filePath}", $f.join("\n"), mode: "a")

end

def updateArt(filePath = "views/art.html")

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"../presets/viewsHead.js\"></script>"); hn
  $f.push("   <body class=\"artBgDeco\">"); hn
  $f.push("     <script src=\"../presets/artJumbo.js\"></script>"); hn
  $f.push("     <script src=\"../presets/viewsNavbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")

  cm("Main Section", true); hn
  $f.push("       <script src=\"../presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"../scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"../scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("../#{filePath}", "w+")
  File.write("../#{filePath}", $f.join("\n"), mode: "a")

end

def updateMisc(filePath = "views/misc.html")

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"../presets/viewsHead.js\"></script>"); hn
  $f.push("   <body class=\"miscBgDeco\">"); hn
  $f.push("     <script src=\"../presets/miscJumbo.js\"></script>"); hn
  $f.push("     <script src=\"../presets/viewsNavbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll fluidBlocks\">"); hn
  cm("Main Section")

  cm("Main Section", true); hn
  $f.push("       <script src=\"../presets/footer.js\"></script>"); hn
  $f.push("     </div>"); hn
  $f.push("     <script src=\"../scripts/navbarSticky.js\"></script>"); hn
  $f.push("     <script src=\"../scripts/footerYear.js\"></script>"); hn
  $f.push("   </body>")
  $f.push("</html>")

  File.new("../#{filePath}", "w+")
  File.write("../#{filePath}", $f.join("\n"), mode: "a")

end
