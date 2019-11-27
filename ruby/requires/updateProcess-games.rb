def updateGames(filePath = "views/games.html")

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"../presets/viewsHead.js\"></script>"); hn
  $f.push("   <body>"); hn
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
