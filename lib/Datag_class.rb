# encoding: CP850


# carregamento do base_yaml n estáva funcionando então resolvi mudar

# um pouco.


require 'yaml'








class DataAcc
  attr_accessor :userExist

  def initialize(file_name)
    @@file_name = file_name
    

    file_name2 = @@file_name
    @nome_da_conta = file_name2

    @@time_cep2 = ( File.expand_path(File.dirname(__FILE__)) ).to_s.match(/(.*?)lib/)
    @@time_cep2 = @@time_cep2[1]
    @@file_socket = ("#{@@time_cep2}/Accounts/#{@nome_da_conta}/dados da conta/#{@nome_da_conta}.yml")
    puts "Files Socker: #{@@file_socket}" 
    if File.exist? @@file_socket
      
      @userExist = true
      @@info_past = YAML.load(File.open(@@file_socket))

      @arr = []

      @@info_past[0].each do |name|
        @arr << name[1]
      end
      @@real_arr = @arr[0]
    else 
      @userExist = false
    end
  end

  def change(cep, new_value)
    cep_real = cep.to_s.length
    file_time = [@@file_name, new_value]
    def load_and_save(file_nm=file_time[0])
      file_var = File.read(file_nm)
      file_array = YAML.load(file_var)
      file_array[$temper] = file_time[1]
      File.open(file_nm, 'w+') do |new_file|
        new_file.puts YAML.dump(file_array)
      end
    end
    if cep_real > 1
      cep.to_s.each_char do |s|
        $temper = []
        $temper << s
      end
      load_and_save()
    else
      $temper = cep.to_i
      load_and_save()
    end
  end


  # recebe de Changer para poder mudar a database
  #e se inicializar com o YAML File ja marcado


  # retornar a senha
  def password_return
	 @@real_arr[1] #senha
  end

  # retornar o nome
  def name_return
    @@real_arr[0] #nome da conta
  end

  #retornar nomes dos textos que tem na caixa
  def return_arr_txts
    IO.write("./DEBUG", "docclass="+@doc.to_s+" andinfoclass= "+@@info_past.class.to_s+"="+@@info_past.to_s)
    @doc = @@info_past[1]
    if @doc["doc"].empty?
      return ["0"]
    else
      return @doc["doc"] #retorna os nomes dentro de um Array
    end
  end

  #adicionar textos
  def add_new_txt(new_txt_name, really_text)
    @really_text = really_text #já é string
    _new_txt_name = new_txt_name

    @this_here = ( File.expand_path(File.dirname(__FILE__)) ).to_s.match(/(.*?)lib/)
    @this_here = @this_here[1]

    _other_here = @nome_da_conta



    file = File.new(((@this_here + "/Accounts/" + name_return + "/textos/guardados/" + _new_txt_name + ".dgtxt").to_s), "w")
    file.close


    File.open((@this_here + "/Accounts/" + name_return + "/textos/guardados/" + _new_txt_name + ".dgtxt"), "w") do |file|
      file.puts @really_text
    end
    begin
      @doc["doc"] << _new_txt_name
    rescue
      sleep 0.70
      @doc["doc"] << _new_txt_name
    ensure
      sleep 0.1
      if ( @doc["doc"].include? _new_txt_name ) == false
        @doc["doc"] << _new_txt_name
      end
    end
    File.open(@@file_socket, "w") do |file|
      file.puts YAML.dump(@@info_past)
    end
  end

  #retornar o texto selecionado
  def return_the_txt(text_selected_named)
    txt_path = ("../Accounts/" + name_return + "/textos/guardados/" + text_selected_named.to_s + ".dgtxt")
    return (File.exist? txt_path)? YAML.load(File.open(txt_path)) : false 
  end

  #deletar textos



  def backGroundColor= color
    @@info_past[4]["fund_color"] = color
    File.open(@@file_socket, "w") do |file|
      file.puts YAML.dump(@@info_past)
    end
  end

  def loadBackGround
    system "color #{backGroundColor}9"
  end

  def backGroundColor
    case @@info_past[4]["fund_color"]
    when 'blue'
      return "1"
    when 'yellow'
      return "E"
    when 'green'
      return "2"
    end
  end


end

=begin
                Example:


				conta_now = DataAcc.new("./example.yml")
        senha = conta_now.password_return <!-- retorna senha
	     nome = conta_now.name_return <!-- retorna nome


=end
