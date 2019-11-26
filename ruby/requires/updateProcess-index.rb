def updateIndex(name = "index.html")

  v = getFiles("../content/home")
  v = v.reverse

  $f = []

  $f.push("<!doctype html>")
  $f.push("<html lang=\"en\">"); hn
  $f.push("   <script src=\"presets/head.js\"></script>"); hn
  $f.push("   <body>"); hn
  $f.push("     <script src=\"presets/indexJumbo.js\"></script>"); hn
  $f.push("     <script src=\"presets/navbar.js\"></script>"); hn
  $f.push("     <div class=\"afterScroll\">"); hn
  cm("Main Section")
  $f.push("       <div class=\"container\">"); hn
  v.each do |contents|
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

  File.new("../#{name}", "w+")
  File.write("../#{name}", $f.join("\n"), mode: "a")

end
