def readTxt database
  system 'cls'
  database.return_arr_txts.each { |text|
  puts "                                  #{text}"
  }
  3.times {puts ""} #^^^^^^ aqui só mostra a lista de textos
  print "  "
  lll = gets.chomp;lll.capitalize! # << fazer para poder ler o selecionado
  begin
    yul = true
    while yul
      system 'cls'
      puts "type 'b' for back\n\n\n\n"
      puts database.return_the_txt(lll).to_s + "\n\n"
      g = gets.chomp
      if g == 'b' || 'B'
        system 'cls'
        yul = false
      else
        system 'cls'
      end
    end
  rescue
    guard_error "s"
    system 'cls'
    5.times {puts ""}
    puts fred("'#{lll}' ainda não existe.")
    temp = gets.chomp
    system 'cls'
    $forEnter = false
    $enter = false
  end
end
