

require "yaml"




def enter
  $enter = true
  while $enter

    5.times {puts ""}
    puts "                                  Qual é a sua conta?"
    $acc = gets.chomp
    $acc.capitalize!
    puts "                                 Qual  é a sua senha?"
    $pass = gets.chomp.to_s
    system 'cls'

    if ($acc || $pass) === "Sair"
      $enter = false
      $forEnter = false
    elsif  ('.\\Accounts\\' + $acc.capitalize + '.yml').is_a? String
      begin
	      $acc_database = '.\\Accounts\\' + $acc.capitalize + '\\dados da conta\\' + $acc.capitalize + '.yml'
          database = DataAcc.new($acc.capitalize.to_s)
          pw_data = database.password_return.to_s
		      acc_data = database.name_return.to_s

          if ($acc == acc_data.to_s && $pass.to_s == pw_data.to_s) == true
            system 'cls'
            $mainAccount = true
            while $mainAccount
              database.loadBackGround
              send_information($acc)
              puts "                   #{fblue("   ")} Write #{red('end')} para sair                     #{fblue("   ")}"
              puts "                   #{fblue("   ")} Write #{black('ctext')} para Criar um texto         #{fblue("   ")}"
              puts "                   #{fblue("   ")} Write #{black('read')} para ler um texto            #{fblue("   ")}"
              puts "                   #{fblue("   ")} Write #{black('backGroundColor')} or #{black('bGC')}            #{fblue("   ")}"
              7.times {puts ""}
              puts "               Entrou como #{black(acc_data)}."
              sleep 0.005
              print "----------------------------->"

              bl = gets.chomp
			        bl.capitalize!
              if bl == "End"
                send_information($acc, "saida")
                system 'cls'
                $mainAccount = false #$y
                $forEnter = false #$g
                $enter =  false #$a
              elsif bl == "Read"
              #/readFunction
                readTxt database
              elsif bl == "Ctext"
              #/createFunction
                createTxt database
              elsif (bl == "Backgroundcolor" || bl == "Bgc")
                $tempForBackColor = true
                while $tempForBackColor
                  system 'cls'
                  2.times {puts ""}
                  puts "colors: blue, yellow or green."
                  puts ""
                  userColorAnsw = gets.chomp
                  case userColorAnsw.capitalize
                  when 'Blue'
                    database.backGroundColor = 'blue'
                    system 'color 19'
                    $tempForBackColor = false
                  when 'Yellow'
                    database.backGroundColor = 'yellow'
                    system 'color E9'
                    $tempForBackColor = false
                  when 'Green'
                    database.backGroundColor = 'green'
                    system 'color 29'
                    $tempForBackColor = false
                  when 'B'
                    $tempForBackColor = false
                  else
                    print fred("\n\ '#{userColorAnsw}' Color not found ")
                    sleep 1.30
                    system 'cls'
                  end
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
