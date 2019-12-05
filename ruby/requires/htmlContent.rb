def hn
    $f.push("")
end

def cm(comment, close = false)
    a = close ? "/" : ""
    temp = "<!-- #{a}#{comment} -->"
    $f.push(temp)
end

def genContent(f, filePath)
  content = getFileLines(filePath)
  ignore = false

  temp = content.index { |x| x.start_with?("~~~") }
  if temp != nil
    ignore = true
  end

  if !ignore
    temp = content.index { |x| x.start_with?("!") }
    theme = nil
    if temp != nil
      theme = content[temp]
      theme = theme[1...theme.length]
      content.delete_at(temp)
    else
      theme = ""
    end

    temp = content.index { |x| x.start_with?("@") }
    header = nil
    if temp != nil
      header = content[temp]
      header = header[1...header.length]
      content.delete_at(temp)
    end

    temp = content.index { |x| x.start_with?("#") }
    subheader = nil
    if temp != nil
      subheader = content[temp]
      subheader = subheader[1...subheader.length]
      content.delete_at(temp)
    end

    temp = content.index { |x| x.start_with?("$") }
    footer = nil
    if temp != nil
      footer = content[temp]
      footer = footer[1...footer.length]
      content.delete_at(temp)
    end

    loop do
      temp = content.index { |x| x.start_with?("*") }
      if temp != nil
        link = content[temp]
        content.delete_at(temp)
        link = link.split("|")
        linkTheme = ""
        if theme != nil
          linkTheme = theme
        end
        save = link[3] != nil ? link[3] : "_self"
        content.each do |line|
          line.gsub!(link[0], "<a class=\"#{linkTheme}\" href=\"#{link[2]}\" target=\"#{save}\">#{link[1]}</a>")
        end
      else
        break
      end
    end

    loop do
      temp = content.index { |x| x.start_with?("%") }
      if temp != nil
        pic = content[temp]
        content.delete_at(temp)
        pic = pic.split("|")
        content.each do |line|
          if pic.count == 3
            line.gsub!(pic[0], "</p><img src=\"#{pic[1]}\" class=\"img-fluid\" alt=\"#{pic[2]}\"><p class=\"noMargin\">")
          elsif pic.count == 4
            line.gsub!(pic[0], "<a href=\"#{pic[3]}\"></p><img src=\"#{pic[1]}\" alt=\"#{pic[2]}\"><p class=\"noMargin\"></a>")
          end
        end
      else
        break
      end
    end

    temp = content.count
    fill = ""
    if temp > 0
      fill = content.join("<br/>")
    end

    f.push("<div class=\"row\">")
    f.push("  <div class=\"col\">")
    f.push("    <div class=\"bodyBox #{theme}\">")
    if header != nil
      f.push("      <h1>#{header}</h1>")
    end
    if subheader != nil
      f.push("      <h2>#{subheader}</h2>")
    end
    if fill != ""
      f.push("      <p class=\"noMargin\">#{fill}</p>")
    end
    if footer != nil
      f.push("      <p class=\"noMargin cancel\"><br/>#{footer}</p>")
    end
    f.push("    </div>")
    f.push("  </div>")
    f.push("</div>")
  end
end

def genMediaContent(f, filePath)
  content = getFileLines(filePath)
  ignore = false

  temp = content.index { |x| x.start_with?("~~~") }
  if temp != nil
    ignore = true
  end

  if !ignore
    temp = content.index { |x| x.start_with?("!") }
    theme = "nHome"
    if temp != nil
      theme = content[temp]
      theme = theme[1...theme.length]
      content.delete_at(temp)
    end

    temp = content.index { |x| x.start_with?("@") }
    title = "Default Title"
    if temp != nil
      title = content[temp]
      title = title[1...title.length]
      content.delete_at(temp)
    end

    temp = content.index { |x| x.start_with?("#") }
    fill = "Default Body Text."
    if temp != nil
      fill = content[temp]
      fill = fill[1...fill.length]
      content.delete_at(temp)
    end

    temp = content.index { |x| x.start_with?("$") }
    genres = []
    if temp != nil
      genres = content[temp]
      genres = genres[1...genres.length].split('|')
      content.delete_at(temp)
    end

    temp = content.index { |x| x.start_with?("%") }
    pic = "../img/256x128pi.jpg"
    if temp != nil
      pic = content[temp]
      pic = pic[1...pic.length]
      content.delete_at(temp)
    end

    page = "/Jauq.github.io/views/" + theme[1...theme.length].downcase + title + ".html"

    f.push("<div class=\"row\">")
    f.push("  <div class=\"col\">")
    f.push("    <div class=\"mediaBox #{theme} row\">")
    f.push("      <a href=\"#{page}\" class=\"col col-auto\"><img src=\"#{pic}\" alt=\"#{title} Thumbnail\"></img></a>")
    f.push("      <div class=\"mediaContent col-sm-12 col-md\">")
    f.push("        <h1><a class=\"#{theme}\" href=\"#{page}\">#{title}</a></h1>")
    f.push("        <p class=\"noMargin\">#{fill}</p>")
    if genres != []
      f.push("        <br class=\"showMed\"/>")
      f.push("        <div class=\"genreTags\">")
      genres.each do |genre|
        f.push("          <a class=\"#{theme}\" href=\"/Jauq.github.io/views/#{theme[1...theme.length].downcase}Genre#{genre}.html\">#{genre}</a>")
      end
      f.push("        </div>")
    end
    f.push("      </div>")
    f.push("    </div>")
    f.push("  </div>")
    f.push("</div>")
  end
end
