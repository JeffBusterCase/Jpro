#guard the errors in a file


def guard_error (option="no")
  if option == "s" || "silence"
    otnm = "_in_text"
  else
    otnm = ""
  end

  $error_name = "error_" << rand(100).to_s << " " << rand(100).to_s << otnm
  file_error_name2 = (".\\lib\\erros\\" << $error_name << ".txt")
  grand = File.new(file_error_name2, "w")
  grand.close
  File.open(file_error_name2, "w") do |file|
    file << Time.now.to_s << "\n\n"
    file << $!
    file << "\n"
    file << $!.backtrace
    file <<  "\n"
    file <<  $!.message
  end
  if option == "no"
    system 'cls'
    9.times {puts ""}
    puts "                          Erro nº: " + $error_name
    puts "\n\n                                 Conta Invalida."
    sleep 5
    system 'cls'
  elsif option == "s" || "silence"
    system 'cls'
  end
end
