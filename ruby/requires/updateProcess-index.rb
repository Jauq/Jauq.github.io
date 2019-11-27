def updateIndex(filePath = "index.html")

  files = getFiles("../content/home")
  files = files.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"presets/head.js\"></script>"); hn
  $f.push("   <body>"); hn
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
