require 'yaml'

#deve ficar ligado quando possivel
#devera monitorar quando alguém se registrar ou quando quiser deletar a conta
#Quando criar textos ou excluilos ou editalos etc.

#e quando ficar online_offline xD


class Monitoramento
  def initialize
    $pasta = "./Accounts"
  end

  #Criar interação com o usuario.(com Threads)
  #tipo quando digitar "hist" mostrar o histórico inteiro de entradas e saidas
  # ou "hist_e" para só entradas e "hist_s" só de saidas.
  def hist
    ( YAML.load(File.open("dgm_Database.yml")) )[0]
  end

  def verific
    #verificar todos os dados de todas as pastas
    ( YAML.load(File.open("dgm_Database.yml")) )[1]
  end

end

system 'cls' #MS-DOS
thefirst = Thread.new {
loop do
  test1 = Monitoramento.new().verific;
  $stdout.puts test1
  usedYet = true
  while usedYet do
    test2 = Monitoramento.new;
    sleep 0.90
    test2 = test2.verific
    usedYet = false if test2 != test1
  end
end
}


print "Monitoramento iniciado:\n"
running = true
while running do
  thefirst #Start Thread
  sleep 0.40
  print "\nDgm:functions:>"
  user = gets.chomp
  uu = user
  case uu.capitalize!
  when "Hist"
    puts Monitoramento.new().hist
  when "Help"
    puts "Stop:   Stop Monitorament;",
         "Hist:   Exib the historic of datag users;",
         "Getout: Exit the console;",
         "Startm: Start monitorament.\n"
  when "Stop"
    if thefirst.status != (false || "dead")
      thefirst.kill
      print "\nMonitoramento desligado\n"
    else
      puts "\nThe monirorament is dead.\n"
    end

  when "Getout"
    system 'cls'#MS-DOS
    running = false
  when "Startm"
    print "\nMonitoramento iniciado:\n"
    thefirst # Initialize Thread with Monitorament
  else
    puts " - '#{user}' is not a function."
  end
end
