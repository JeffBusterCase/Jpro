require 'yaml'

#quando entrar deve-se enviar a informação
#quando sair deve-se enviar a informação


def little
  info = [[],[]] # guarda os valores das açoes dos usuarios
  memo = YAML.load(File.open("dgm_Database.yml")) # carrega o arquivo como
  info[0] << memo[0]
  return info
end


def send_information(user_name, option="enter")


  if option == "enter"
    lit = little
    lit[0] << (user_name.to_s + " login at " + (Time.now.to_s).match(/(.*?) -/)[1])
    lit[1] = (user_name.to_s + " login at " + (Time.now.to_s).match(/(.*?) -/)[1])
    File.open("dgm_Database.yml", "w") do |the_file|
       the_file.puts YAML.dump(lit)
    end
  elsif option == "saida"
    lit = little
    lit[0] << (user_name.to_s + " exit at " + (Time.now.to_s).match(/(.*?) -/)[1])
    lit[1] = (user_name.to_s + " exit at " + (Time.now.to_s).match(/(.*?) -/)[1])
    File.open("dgm_Database.yml", "w") do |the_file|
       the_file.puts YAML.dump(lit)
    end
  end
end

=begin
def send_information(user_name)
  info = []
  #memo = YAML.load(File.open("dmg_Database.yml")
  info << (user_name.to_s + Time.now.to_s)
  File.open("dgm_Database.yml", "w") do |the_file|
     the_file.puts YAML.dump(info)
  end
end
=end
