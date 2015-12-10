# encoding: UTF-8

require ".\\lib\\Datag_class.rb"

require 'yaml'

require '.\organizer.rb'

require ".\\lib\\cortez.rb"





=begin
Variaveis para loops
=end

$criadortext = 0
$shrom = 5
$tt = $shrom - 1
$g = 0
$y = 0
$h = 0
$xx = 0
$kk = 0
$a = 0
$t = 1


##^^^^^^


system 'color f9'
system 'cls'




def create
  puts "Nome da conta:"
  $user = gets.chomp.capitalize!
  puts "Senha:"
  password = gets.chomp.to_s
  puts ""
  puts "Primeiro nome:"
  $nm = gets.chomp.to_s.capitalize!
  puts ""
  puts "Ultimo nome:"
  $sobre = gets.chomp.to_s
  $fund = "nada"
  $fav_anml = "nada"

  $arr_hist = [
    {"account" => [$user, password]},
	  {"doc" => []},
	  {"first_name" => $nm},
    {"last_name" => $sobre},
	  {"fund_color" => $fund},
	  {"fav_anml" => $fav_anml}
  ]









  def gdata (name=".\\Accounts\\#{$user.capitalize}\\dados da conta\\#{$user.capitalize}.yml", mode="w")

# Deck de pastas para as contas
  Thread.new {
	Dir.mkdir(".\\Accounts\\#{$user.capitalize}")

	Dir.mkdir(".\\Accounts\\#{$user.capitalize}\\textos")
	Dir.mkdir(".\\Accounts\\#{$user.capitalize}\\textos\\enviados")
	Dir.mkdir(".\\Accounts\\#{$user.capitalize}\\textos\\guardados")
	Dir.mkdir(".\\Accounts\\#{$user.capitalize}\\textos\\rascunhos")


	Dir.mkdir(".\\Accounts\\#{$user.capitalize}\\caixa de entrada")
	Dir.mkdir(".\\Accounts\\#{$user.capitalize}\\config")
	Dir.mkdir(".\\Accounts\\#{$user.capitalize}\\dados da conta")

	file = File.new(name, mode)
  file.close

    File.open(name, mode) do
      |arq|
      arq.puts YAML.dump($arr_hist)
    end
  }
  end

  $kk += 1
  while $kk > 0 do
    gdata
    $kk -= 1
  end
  system 'cls'
  7.times {puts ""}
  puts "             |   |   |   |    Conta criada com sucesso! |   |   |   |"
  sleep 4
  gets.chomp
  system 'cls'
  $xx += 1
  while $xx > 0 do
    enter
    $xx -= 1
    $kk -= 1
    $h -= 1
  end
end

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

def enter
  $a += 1
  while $a > 0 do

    5.times {puts ""}
    puts "                                  Qual é a sua conta?"
    $acc = gets.chomp
    $acc.capitalize!
    puts "                                 Qual  é a sua senha?"
    $pass = gets.chomp.to_s
    system 'cls'

    if ($acc || $pass) === "Sair"
      $a -= 1
      $g -= 1
    elsif  ('.\\Accounts\\' + $acc.capitalize + '.yml').is_a? String
      begin
	      $acc_database = '.\\Accounts\\' + $acc.capitalize + '\\dados da conta\\' + $acc.capitalize + '.yml'
          database = DataAcc.new($acc.capitalize.to_s)
          pw_data = database.password_return.to_s
		      acc_data = database.name_return.to_s

          if ($acc == acc_data.to_s && $pass.to_s == pw_data.to_s) == true
            system 'cls'
            $y += 1
            while $y > 0 do
              send_information($acc)
              puts "                            Write #{red('end')} para sair"
              puts "                            Write #{black('ctext')} para Criar um texto"
              puts "                            Write #{black('read')} para ler um texto"
              7.times {puts ""}
              puts "               Entrou como #{black(acc_data)}."
              sleep 0.005
              print "----------------------------->"
              bl = gets.chomp
			        bl.capitalize!
              if bl == "End"
                send_information($acc, "saida")
                system 'cls'
                $y -= 1
                $g -= 1
                $a -= 1
              elsif bl == "Read"
                system 'cls'
                database.return_arr_txts.each { |text|
                puts "                                  #{text}"
                }
                3.times {puts ""} #^^^^^^ aqui só mostra a lista de textos
                print "  "
                lll = gets.chomp;lll.capitalize! # << fazer para poder ler o selecionado
                begin
                  yul = 0
                  while yul < 1 do
                    system 'cls'
                    puts "type 'b' for back\n\n\n\n"
                    puts database.return_the_txt(lll).to_s + "\n\n"
                    g = gets.chomp
                    if g == 'b' || 'B'
                      system 'cls'
                      yul += 1
                      $g -= 1
                      $a -= 1
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
                  $g -= 1
                  $a -= 1
                end
              elsif bl == "Ctext"
                $criadortext += 1
                $doom = 5
                while $criadortext > 0 do
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
                  if bb == nil
                    system 'cls'
                    $a -= 1
                  else
                    system 'cls'
                    $a -= 1
                  end
                  $criadortext -= 1
                end
              else
                system 'cls'
              end
            end
          elsif ($acc == acc_data.to_s && $pass.to_s != pw_data.to_s) == true
            system 'cls'
            5.times {puts ""}
            puts "              A conta está correta, mas a senha não."
            puts ""
            puts "                 Conta: #{acc_data.to_s}."
            sleep 3
            system 'cls'
          else
            system 'cls'
            7.times {puts ""}
            puts "                        ERRO NA ENTRADA DA CONTA"
            sleep 5
			      system 'cls'
          end
      rescue
	      guard_error
      end
	  else
      system 'cls'
      5.times(puts " ")
	    puts "                       Você foi para fora do bloco!!"
	    sleep 3
    end
  end
end










$t += 1
while $t > 0 do
  puts "                              (Aperte: Sair para Sair)      "
  4.times{puts ""}
  puts "                       Entrar em uma conta existente: enter"
  puts "                   #{psp('|        |        |        |        |        |')}"
  puts "                                Criar conta: criar"
  print "                               "
  pedido = gets.chomp
  pedido.capitalize!
  case pedido
  when "Enter"
    system 'cls'
    $g += 1
    while $g > 0 do
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
      $g =- 1
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
    $t -= 2
  else
    system 'cls'
    9.times {puts ""}
    puts "                  Ecreva Enter ou Sair"
    sleep 2
    system 'cls'
  end
end
