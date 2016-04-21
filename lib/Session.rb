#User UI


class Session
    
    attr_reader :status
    def initialize(user)
        @user = DataAcc.new(user)
        @login = @user.name_return
        @password = @user.password_return
        @status = nil
    end

    def start
        loadUserBackGround
        @status = true
        while @status
            mainThreadSession
            $os.clear
        end
    end
    
    def kill
        @status = false
    end
    
    private 
    
    def loadUserBackGround
        @user.loadBackGround    
    end
    
    def mainThreadSession
        @user.loadBackGround
        send_information(@login) if $canAlert
        
        puts "                   #{fblue("   ")} Write #{red('end')} para sair                     #{fblue("   ")}",
             "                   #{fblue("   ")} Write #{whi('ctext')} para Criar um texto         #{fblue("   ")}",
             "                   #{fblue("   ")} Write #{whi('read')} para ler um texto            #{fblue("   ")}",
             "                   #{fblue("   ")} Write #{whi('backGroundColor')} or #{whi('bGC')}            #{fblue("   ")}"
        7.times {puts ""}
        puts "               Entrou como #{whi(@login)}."
        sleep 0.005
        print "----------------------------->"
        
        select_tool = gets.chomp.capitalize
        
        if select_tool == ("End" || "Endsession")
            send_information(@login, "saida") if $canAlert
            $os.clear
            self.kill
            $forEnter = false
            $enter = false
        elsif select_tool == "Read"
            readTxt @user
        elsif select_tool == ("Ctext" || "New txt")
            puts red("start creating text")
            sleep 1
            createTxt @user
            sleep 1
        elsif select_tool == ("Backgroundcolor" || "Bgc")
            $tempForBackColor = true
            while $tempForBackColor
                $os.clear
                2.times {puts ""}
                puts "colors: \n --blue, \n--yellow \n--green.",
                     ""
                userColorAnsw = gets.chomp
                case userColorAnsw.capitalize
                    when 'Blue'
                        @user.backGroundColor = 'blue'
                        system 'color 19'
                        $tempForColor = false
                    when 'Yellow'
                        @user.backGroundColor = 'yellow'
                        system 'color E9'
                        $tempForBackColor = false
                    when 'Green'
                        @user.backGroundColor = 'green'
                        system '29'
                        $tempForBackColor = false
                    when 'B'
                        $tempForBackColor = false
                    else
                        print fred("\n\ '#{userColorAnsw}' Color not found ")
                        sleep 1.30
                        $os.clear
                end#END CASE STATAMENT
            end#END WHILE STATAMENT
        end#END IF STATAMENT
    end#END FUNCTION
end