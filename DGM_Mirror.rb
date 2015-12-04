require 'yaml'
require 'net/http'
#deve ficar ligado quando possivel
#devera monitorar quando alguém se registrar ou quando quiser deletar a conta
#Quando criar textos ou excluilos ou editalos etc.

#e quando ficar online_offline xD


class Monitoramento
  def initialize
    $pasta = ".\\Accounts"
    @@database_site = "http://thecross.ddns.net:5371/dgm_Database.yml"
    response = Net::HTTP.get_response(URI.parse(@@database_site))
    @@the_database = YAML.load(response.body)
  end

  #Criar interação com o usuario.(com Threads)
  #tipo quando digitar "hist" mostrar o histórico inteiro de entradas e saidas
  # ou "hist_e" para só entradas e "hist_s" só de saidas.
  def hist
    $hist = @@the_database
    return $hist[0]
  end

  def verific
    #verificar todos os dados de todas as pastas
    $arr_folder = @@the_database
    return $arr_folder[1]
  end

end
a = 1
system 'cls'
thefirst = Thread.new {
while a > 0 do
  test1 = Monitoramento.new;
  test1 = test1.verific
  $stdout.puts test1
  b = 0
  while b < 1 do
    test2 = Monitoramento.new;
    sleep 0.90
    test2 = test2.verific
    if test2 != test1
      b += 1
    end
  end
end
}


print "Monitoramento iniciado:\n"
sysuser = 0
time = 0.70
while sysuser < 1 do
  thefirst
  sleep time
  print "\nDgm:functions:>"
  if time == 0.70
    time -= 0.20
  end
  user = gets.chomp
  uu = user
  case uu.capitalize!
  when "Cls"
    system 'cls'
  when "Hist"
    por_enquanto = Monitoramento.new;
    puts por_enquanto.hist
  when "Help"
    puts "Stop:   Stop Monitorament;"
    puts "Hist:   Exib the historic of datag users;"
    puts "Getout: Exit the console;"
    puts "Startm: Start monitorament.\n"
  when "Stop"
    if thefirst.status != (false || "dead")
      thefirst.kill
      print "Monitoramento desligado\n"
    else
      puts "\nThe monirorament is dead.\n"
    end

  when "Getout"
    system 'cls'
    sysuser =+ 1
  when "Startm"
    print "\nMonitoramento iniciado:\n"
    thefirst
  else
    puts " - '#{user}' is not a function."
  end
end
