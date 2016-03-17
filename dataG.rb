# encoding: UTF-8

require ".\\lib\\Datag_class.rb"

require ".\\lib\\DG_MAIN.rb"

require ".\\lib\\guard_error.rb"

require ".\\lib\\createTxt.rb"

require ".\\lib\\readTxt.rb"

require ".\\lib\\createAccount.rb"

require 'yaml'

require '.\organizer.rb'

require ".\\lib\\cortez.rb"





=begin
Variaveis para loops
=end


$shrom = 5
$tt = $shrom - 1
$h = 0
$t = true


##^^^^^^

system 'color f9'
system 'cls'



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
  puts "                       Entrar em uma conta existente: #{black("enter")}"
  puts "                   #{green('|        |        |        |        |        |')}"
  puts "                       Criar conta: #{black("criar")}"
  print "                               "
  pedido = gets.chomp
  pedido.capitalize!
  case pedido
  when "Enter"
    system 'cls'
    $forEnter = true
    while $forEnter
      begin
        enter
      rescue

        system 'cls'
        8.times {puts ''}
		    $error_name = "error_" << rand(100).to_s << " " << rand(100).to_s
        file_error_name = (".\\lib\\erros\\" << $error_name << ".txt")
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
        puts "                     grande erro: " + $error_name
        puts '\n\n\n                            Sua conta deve ser invalida!'
        sleep 2
        system 'cls'
      end
      $forEnter = false
    end
  when "Criar"
    system 'cls'
    $h += 1
    while $h > 0 do
      create
      $h -= 1
    end
  when "Sair"
    system 'cls'
    $t = false
  else
    system 'cls'
    9.times {puts ""}
    puts "                  Ecreva Enter ou Sair"
    sleep 1
    system 'cls'
  end
end
