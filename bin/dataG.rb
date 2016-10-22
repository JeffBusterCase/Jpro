# encoding: UTF-8

require_relative "../lib/Datag_class"

require_relative "../lib/DG_MAIN2"

require_relative '../lib/Session'

require_relative "../lib/guard_error"

require_relative '../lib/SYSTEM.OS/CONSTANTS'

require_relative "../lib/createTxt"

require_relative "../lib/readTxt"

require_relative "../lib/createAccount"

require_relative "../lib/cortez"

require_relative "../lib/SYSTEM.OS/system"

require 'yaml'

require_relative '../lib/organizer'

include Error_Labels
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

#--Constants for error log
include Error_Labels


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
        "(#{cian(Config.load('hackByTag'))})\n"
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
        guard_error BIN_ERROR, true
        sleep 2
        $os.clear
      end
      $forEnter = false
    end
  when "Criar"
    $os.clear
    begin
      loop do
        create
        break
      end
    rescue
      guard_error NEW_ACCOUNT_ERROR, true
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
