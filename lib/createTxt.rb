
def createTxt database
  begin
    criadortext = true
    doom = 5
    while criadortext
      $os.clear

      print "\n\n\nNome do texto:"
      text_name = gets.chomp
      lines = nil
      3.times {puts ""}
      while doom > 0 do
        while doom > $tt do
          lines = gets.chomp
          $tt += 1
        end
        hj = gets.chomp
        lines << "\n" + hj
        doom -= 1
      end
      text_name.capitalize!
      file_of_text = "\n #{text_name} \n  #{lines}"
      database.add_new_txt(text_name, file_of_text)
      $os.clear
      puts "\n\n\n\n\n                        Texto salvo com sucesso"
      bb = gets.chomp
      $os.clear
      criadortext = false
    end
  rescue
    guard_error TEXT_ERROR, true
  end
end
