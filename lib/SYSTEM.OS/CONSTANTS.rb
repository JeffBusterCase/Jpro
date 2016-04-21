module Error_Labels
    TEXT_ERROR = 0
    UNDEFINED_LOCAL_ERROR = 1
    LOGIN_ERROR = 2
    SESSION_ERROR = 3
    BIN_ERROR = 4
    READ_TEXT_ERROR = 5
    NEW_ACCOUNT_ERROR = 6
    SOMETHING_GOES_WRONG = 7
    
    def self.easyMessage label
        case label
            when 0
                "Something goes wrong in the text alocation"
            when 1
                "Something undefined goes wrong"
            when 2
                "Something goes wrong in your login"
            when 3
                "Something goes wrong in your session =("
            when 4
                "Some hard error occured in path bin"
            when 5
                "Something goes wrong reading texts"
            when 6
                "Something goes wrong trying to create a new account"
            when 7
                "Something goes wrong"
            else 
                "Something crashed here T.T"
            
        end
    end
end