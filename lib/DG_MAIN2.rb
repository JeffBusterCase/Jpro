
#New version of DG_MAIN
#Take out bug to know if a user file exist
#Now use File.exit? file, avoiding the error


def enter
    $enter = true
    while $enter
        5.times {puts ""}
        puts "                                  Qual é a sua conta?"
        acc = gets.chomp
        acc.capitalize!
        puts "                                 Qual  é a sua senha?"
        pass = gets.chomp.to_s
        $os.clear
        
        if (acc || pass) === "Sair"
            $enter = false
            $forEnter = false
            
        elsif DataAcc.new(acc).userExist
            $os.clear
            sess = Session.new(acc)
            sess.start
            $os.clear
        elsif !(DataAcc.new(acc).userExist)
            $os.clear
            5.times {puts ""}
            puts "              invalid account"
            sleep 2.50
            $os.clear
        else 
            puts "Something goes wrong"
            guard_error
        end
            
    end
end