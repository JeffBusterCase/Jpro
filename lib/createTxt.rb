
def createTxt database
  $criadortext = true
  $doom = 5
  while $criadortext
    system 'cls'


    3.times {puts ""}
    print "Nome do texto:"
    $text_name = gets.chomp

    3.times {puts ""}
    while $doom > 0 do
      while $doom > $tt do
        $lines = gets.chomp
        $tt += 1
      end
      $hj = gets.chomp
      $lines << "\n" + $hj
      $doom -= 1
    end
    $text_name.capitalize!
    file_of_text = "\n #{$text_name} \n  #{$lines}"
    database.add_new_txt($text_name, file_of_text)
    system 'cls'
    5.times{puts ""}
    puts "                        Texto salvo com sucesso"
    bb = gets.chomp
    system 'cls'
    $criadortext = false
  end
end
