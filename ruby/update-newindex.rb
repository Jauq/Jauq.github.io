require_relative "getFiles.rb"
require_relative "htmlContent.rb"

v = getFiles("../content/home")
v = v.reverse

puts "Updating newindex.html..."

File.new("../newindex.html", "w+")

$f = []

$f.push("<!doctype html>")
$f.push("<html lang=\"en\">"); hn
$f.push("   <script src=\"presets/head.js\"></script>"); hn
$f.push("   <body>"); hn
$f.push("     <script src=\"presets/jumbo.js\"></script>"); hn
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

File.write("../newindex.html", $f.join("\n"), mode: "a")

puts "Update Successful!"
print "Press enter to continue."
gets
