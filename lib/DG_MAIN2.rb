
#New version of DG_MAIN
#Take out bug to know if a user file exist
#Now use File.exit? file, avoiding the error

#
#
#
# => Login Page
#
#
#

def enter
    begin
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
                begin #Starting Session
                    sess = Session.new(acc)
                    sess.start
                rescue
                    guard_error SESSION_ERROR, true
                    $os.clear
                end
                $os.clear
            elsif !(DataAcc.new(acc).userExist)
                $os.clear
                5.times {puts ""}
                puts "              invalid account"
                sleep 2.50
                $os.clear
            else 
                puts "Something goes wrong"
                guard_error SOMETHING_GOES_WRONG, true
            end
        end
    rescue
        guard_error LOGIN_ERROR, true
    end
end