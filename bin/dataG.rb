# encoding: UTF-8

require "../lib/Datag_class"

require "../lib/DG_MAIN"

require "../lib/guard_error"

require "../lib/createTxt"

require "../lib/readTxt"

require "../lib/createAccount"

require "../lib/cortez"

require "../lib/SYSTEM.OS/system"

require 'yaml'

require '../lib/organizer'

#initialize the system OS
# Change the value inside the '()' in config/config.txt )
$os = OS.new(Config.load('OperationalSystem'))

#Send status of users?
$canAlert = Config.load('sendInformation')

=begin
Variaveis para loops
=end


$shrom = 5
$tt = $shrom - 1
$h = 0
$t = true


##^^^^^^

system 'color f9'#MS-DOS
$os.clear#clear the terminal


#
#
#
#                           Tela Principal/HOME
#
#
#


while $t
  print "Hacked by #{Config.load('hackBy').capitalize.sub('_', " ").sub('b', "B")}",
        "(#{Config.load('hackByTag')})\n"
  puts "(Press: #{whi("Sair")} to exit)",
       "DataG Version 2.0.53"
  3.times{puts ""}
  print "\n                           To login with a existant account: #{whi("enter")}",
        "\n                   #{green('|        |        |        |        |        |')}",
        "\n                    Or  create Account: #{whi("criar")}\n",
        "                               "
  pedido = gets.chomp
  pedido.capitalize!
  case pedido
  when "Enter"
    $os.clear
    $forEnter = true
    while $forEnter
      begin
        enter
      rescue

        $os.clear
        8.times {puts ''}
		    $error_name = "error_" << rand(100).to_s << " " << rand(100).to_s
        file_error_name = ("../lib/erros/" << $error_name << ".txt")
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
        $os.clear
      end
      $forEnter = false
    end
  when "Criar"
    $os.clear
    loop do
      create
      break
    end
  when "Sair"
    $os.clear
    $t = false
  else
    $os.clear
    6.times {puts ""}
    puts "                  Ecreva Enter ou Sair"
    sleep 0.89
    $os.clear
  end
end
