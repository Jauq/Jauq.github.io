$themes = ["Home", "Games", "Music", "Art", "Misc"]
class Content
  attr_accessor :theme, :title, :subtitle, :footer, :links, :pics, :body
  def initialize
    @theme = "Home"
    @title = nil
    @subtitle = nil
    @footer = nil
    @links = []
    @pics = []
    @body = nil
  end

  def read
    puts ""
    puts "Theme:    \"#{@theme}\""
    puts "Title:    \"#{@title}\""
    puts "Subtitle: \"#{@subtitle}\""
    puts "Footer:   \"#{@footer}\""
    puts "Links:    #{@links}"
    puts "Pics:     #{@pics}"
    puts "Body:     \"#{@body}\""
  end

  def createContent(folder)

    prevEntryCount = Dir.glob("../content/#{folder}/*.txt").count
    fileName = "#{"0" * (16 - prevEntryCount.to_s.length)}#{prevEntryCount}.txt"

    File.open("../content/#{folder}/#{fileName}", "w+") do |f|
      f.puts("!n" + @theme)
      if @title != nil
        f.puts("@#{@title}")
      end
      if @subtitle != nil
        f.puts("##{@subtitle}")
      end
      if @footer != nil
        f.puts("$#{@footer}")
      end
      @links.each do |link|
        f.puts(link)
      end
      @pics.each do |pic|
        f.puts(pic)
      end
      if @body != nil
        f.puts(@body)
      end
    end

  end

end

content = Content.new

loop do

  content.read

  print "\nType the name of what you want to edit, or type 'done' to finish and create this content: "
  input = gets.chomp.downcase
  puts ""

  if input == "theme" or input == "th"
    puts "Select a theme: 0-Home, 1-Games, 2-Music, 3-Art, 4-Misc. Any other input will default to 0-Home."
    print "> "
    input = gets.chomp.to_i
    content.theme = $themes[input]
  elsif input == "title" or input == "ti"
    print "Type the title for this content: "
    input = gets.chomp
    if input == ""
      content.title = nil
    else
      content.title = input
    end
  elsif input == "subtitle" or input == "su"
    print "Type the subtitle for this content: "
    input = gets.chomp
    if input == ""
      content.subtitle = nil
    else
      content.subtitle = input
    end
  elsif input == "footer" or input == "fo"
    print "Type the footer for this content: "
    input = gets.chomp
    if input == ""
      content.footer = nil
    else
      content.footer = input
    end
  elsif input == "body" or input == "bo"
    print "Type the body for this content: "
    input = gets.chomp
    if input == ""
      content.body = nil
    else
      content.body = input
    end
  elsif input == "links" or input == "li"
    content.links.count.times do |z|
      puts "[#{z}] #{content.links[z]}"
    end
    puts "\nAbove are the list of current links. Type 'new' or 'delete' to do accordingly."
    print "> "
    input = gets.chomp.downcase
    if input == "new" or input == "n"
      invalid = false

      print "Link *key: "
      temp = ""
      input = gets.chomp
      if input.start_with?("*")
        input = input[1...input.length]
      end
      invalid = true if input.length < 1
      invalid = true if input.include?("|")
      temp += "*#{input}"

      print "Link words: "
      input = gets.chomp
      invalid = true if input == ""
      invalid = true if input.include?("|")
      temp += "|#{input}"

      print "Link path: "
      input = gets.chomp
      invalid = true if input == ""
      invalid = true if input.include?("|")
      temp += "|#{input}"

      print "Tab type (_blank, _self): "
      input = gets.chomp
      if input != ""
        invalid = true if input.include?("|")
        temp += "|#{input}"
      end

      if invalid
        puts "This link is blatantly invalid, most of these cannot be blank or have the '|' symbol in them."
      else
        content.links.push(temp)
      end
    elsif input == "delete" or input == "d"
      puts "Type the id of the link you want to delete (type nothing to quit, otherwise all other entries default to 0)"
      print "> "
      input = gets.chomp
      if input != "" and input.to_i < content.links.count
        content.links.delete_at(input.to_i)
      end
    else
      puts "That doesn't appear to be a valid action you can do with links."
    end
  elsif input == "pics" or input == "pi"
    content.pics.count.times do |z|
      puts "[#{z}] #{content.pics[z]}"
    end
    puts "\nAbove are the list of current pics. Type 'new' or 'delete' to do accordingly."
    print "> "
    input = gets.chomp.downcase
    if input == "new" or input == "n"
      invalid = false

      print "Pic %key: "
      temp = ""
      input = gets.chomp
      if input.start_with?("%")
        input = input[1...input.length]
      end
      invalid = true if input.length < 1
      invalid = true if input.include?("|")
      temp += "%#{input}"

      print "Pic path: "
      input = gets.chomp
      invalid = true if input == ""
      invalid = true if input.include?("|")
      temp += "|#{input}"

      print "Pic alt: "
      input = gets.chomp
      invalid = true if input == ""
      invalid = true if input.include?("|")
      temp += "|#{input}"

      print "Pic link (can be blank): "
      input = gets.chomp
      if input != ""
        invalid = true if input.include?("|")
        temp += "|#{input}"
      end

      if invalid
        puts "This pic is blatantly invalid, most of these cannot be blank or have the '|' symbol in them."
      else
        content.pics.push(temp)
      end
    elsif input == "delete" or input == "d"
      puts "Type the id of the pic you want to delete (type nothing to quit, otherwise all other entries default to 0)"
      print "> "
      input = gets.chomp
      if input != "" and input.to_i < content.pics.count
        content.pics.delete_at(input.to_i)
      end
    else
      puts "That doesn't appear to be a valid action you can do with links."
    end
  elsif input == "done" or input == "do"
    puts "Type the subfolder where this content will be generated."
    print ">"
    input = gets.chomp.downcase
    content.createContent(input)
    break
  else
    puts "I don't know what you are asking for."
  end

end

puts "Content was successfully created!"
print "Press enter to close."
gets
