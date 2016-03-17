def readTxt database
  $os.clear
  database.return_arr_txts.each { |text|
  puts "                                  #{text}"
  }
  3.times {puts ""} #^^^^^^ aqui só mostra a lista de textos
  print "  "
  lll = gets.chomp;lll.capitalize! # << fazer para poder ler o selecionado
  begin
    yul = true
    while yul
      $os.clear
      puts "type 'b' for back\n\n\n\n"
      puts database.return_the_txt(lll).to_s + "\n\n"
      g = gets.chomp
      if g == 'b' || 'B'
        $os.clear
        yul = false
      else
        $os.clear
      end
    end
  rescue
    guard_error "s"
    $os.clear
    5.times {puts ""}
    puts fred("'#{lll}' ainda não existe.")
    temp = gets.chomp
    $os.clear
    $forEnter = false
    $enter = false
  end
end
