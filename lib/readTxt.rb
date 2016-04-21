def readTxt database
  begin
    $os.clear
    database.return_arr_txts.each { |text|
      puts "                                  #{text}"
    }
    #^^^^^^ aqui só mostra a lista de textos
    print "\n\n\n  "
    txt_requested = gets.chomp.capitalize 
    text = database.return_the_txt(txt_requested)
      if text != false
        yul = true
        while yul
          $os.clear
          puts "type 'b' for back\n\n\n\n",
               text.to_s + "\n\n"
          g = gets.chomp
          if g == ("b" || "B")
            $os.clear
            yul = false
          else
            $os.clear
          end
        end
      end
      puts fred("\n\n\n\n\n'#{txt_requested}' ainda não existe.") if text == false && !(txt_requested.include? " ")
      delMe = gets.chomp if text == false
      $os.clear
      $forEnter = false
      $enter = false
  rescue
    guard_error READ_TEXT_ERROR, true
  end
end
