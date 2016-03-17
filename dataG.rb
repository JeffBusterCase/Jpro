# encoding: UTF-8

require "./lib/Datag_class"

require "./lib/DG_MAIN"

require "./lib/guard_error"

require "./lib/createTxt"

require "./lib/readTxt"

require "./lib/createAccount"

require 'yaml'

require './organizer'

require "./lib/cortez"





=begin
Variaveis para loops
=end


$shrom = 5
$tt = $shrom - 1
$h = 0
$t = true


##^^^^^^

system 'color f9'#MS-DOS
system 'cls'#MS-DOS



#
#
#
#                           Tela Principal/HOME
#
#
#


while $t
  puts "                              (Aperte: #{black("Sair")} para Sair)      "
  4.times{puts ""}
  print "\n                       Entrar em uma conta existente: #{black("enter")}",
        "\n                   #{green('|        |        |        |        |        |')}",
        "\n                       Criar conta: #{black("criar")}",
        "                               "
  pedido = gets.chomp
  pedido.capitalize!
  case pedido
  when "Enter"
    system 'cls'#MS-DOS
    $forEnter = true
    while $forEnter
      begin
        enter
      rescue

        system 'cls'
        8.times {puts ''}
		    $error_name = "error_" << rand(100).to_s << " " << rand(100).to_s
        file_error_name = ("./lib/erros/" << $error_name << ".txt")
        grand = File.new(file_error_name, "w")
	      grand.close

	       File.open(file_error_name, "w") do |file|
		       file << Time.now.to_s << "\n\n"
           file << $!
		       file << "\n"
		       file << $!.backtrace
		       file << "\n"
		       file <<  $!.message
		     end
        puts ("                     grande erro: " + $error_name),
              "\n                            Sua conta deve ser invalida!"
        sleep 2
        system 'cls'#MS-DOS
      end
      $forEnter = false
    end
  when "Criar"
    system 'cls'#MS-DOS
    loop do
      create
      break
    end
  when "Sair"
    system 'cls'#MS-DOS
    $t = false
  else
    system 'cls'#MS-DOS
    6.times {puts ""}
    puts "                  Ecreva Enter ou Sair"
    sleep 0.89
    system 'cls'#MS-DOS
  end
end
