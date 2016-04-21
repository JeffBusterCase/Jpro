def create
  
  puts "Nome da conta:"
  user = gets.chomp.capitalize!
  puts "Senha:"
  password = gets.chomp.to_s
  puts ""
  puts "Primeiro nome:"
  nm = gets.chomp.to_s.capitalize!
  puts ""
  puts "Ultimo nome:"
  sobre = gets.chomp.to_s
  fund = "nada"
  fav_anml = "nada"

  arr_hist = [
    {"account" => [user, password]},
	  {"doc" => []},
	  {"first_name" => nm},
    {"last_name" => sobre},
	  {"fund_color" => fund},
	  {"fav_anml" => fav_anml}
  ]


  def gdata (name="../Accounts/#{user.capitalize}/dados da conta/#{user.capitalize}.yml", mode="w")

# Deck de pastas para as contas

	Dir.mkdir("../Accounts/#{user.capitalize}")

	Dir.mkdir("../Accounts/#{user.capitalize}/textos")
	Dir.mkdir("../Accounts/#{user.capitalize}/textos/enviados")
	Dir.mkdir("../Accounts/#{user.capitalize}/textos/guardados")
	Dir.mkdir("../Accounts/#{user.capitalize}/textos/rascunhos")


	Dir.mkdir("../Accounts/#{user.capitalize}/caixa de entrada")
	Dir.mkdir("../Accounts/#{user.capitalize}/config")
	Dir.mkdir("../Accounts/#{user.capitalize}/dados da conta")

	file = File.new(name, mode)
  file.close

    File.open(name, mode) do
      |arq|
      arq.puts YAML.dump(arr_hist)
    end

  end

  $gdata = true
  while $gdata
    gdata
    $gdata =false
  end
  $os.clear
  7.times {puts ""}
  puts "             |   |   |   |    Conta criada com sucesso! |   |   |   |"
  sleep 4
  gets.chomp
  $os.clear
  $onlyHere = true
  while $onlyHere
    enter
    $onlyHere = false
    $gdata = false
    $h -= 1
  end
end
