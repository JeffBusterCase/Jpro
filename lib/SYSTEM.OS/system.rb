class OS
    def initialize(operationalS)
        #win, linux
        @os = operationalS.downcase
    end
    
    def clear
        system 'cls' if @os == "win"
        system 'clear' if @os == "linux"
    end
end

=begin
    initialize by
        variable = OS.new("win")
            or
        variable = OS.new("linux")
=end

module Config
    CONFIG_PATH = "../config/config"
    def self.load variableName
        config_file = File.read CONFIG_PATH
        
        
        toReturn = ( config_file.match /#{variableName}\((.*)\)#/)
        if toReturn != nil
            toReturn = toReturn[1].downcase
        else
            toReturn = ( config_file.match /#{variableName}\((.*?)\)/ )
            if toReturn != nil
                toReturn = toReturn[1].downcase
            else
                toReturn = "undeclared variable '#{variableName}'"
            end
        end
        
        if ( toReturn == "on" || toReturn == "true" )
            return true
        elsif ( toReturn == "off" || toReturn == "false" )
            return false
        else
            return toReturn
        end
    end
end
 
# Try use this to get the value of the variable
# puts Config.load('myName')
# puts Config.load('OperationalSystem')