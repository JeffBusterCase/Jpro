# encoding: CP850


# carregamento do base_yaml n estáva funcionando então resolvi mudar

# um pouco.


require 'yaml'








class DataAcc


  def initialize(file_name)
    @@file_name = file_name


    $file_name2 = @@file_name
    $nome_da_conta = $file_name2

    @@time_cep2 = ( File.expand_path(File.dirname(__FILE__)) ).to_s.match /(.*?)ter/
    @@time_cep2 = @@time_cep2[0]
    @@file_socket = "#{@@time_cep2}\\Accounts\\" + $nome_da_conta + "\\dados da conta\\" + $nome_da_conta + ".yml"

    #para password e account name

    @@info_past = YAML.load(File.open(@@file_socket))

    @arr = []

    @@info_past[0].each do |name|
      @arr << name[1]
    end
    @@real_arr = @arr[0]
  end

  def change(cep, new_value)
    cep_real = cep.to_s.length
    $file_time = [@@file_name, new_value]
    def load_and_save(file_nm=$file_time[0])
      $file_var = File.read(file_nm)
      $file_array = YAML.load($file_var)
      $file_array[$temper] = $file_time[1]
      File.open(file_nm, 'w+') do |new_file|
        new_file.puts YAML.dump($file_array)
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
	 return  @@real_arr[1] #senha
  end

  # retornar o nome
  def name_return
    return @@real_arr[0] #nome da conta
  end

  #retornar nomes dos textos que tem na caixa
  def return_arr_txts
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
    $new_txt_name = new_txt_name

    @this_here = ( File.expand_path(File.dirname(__FILE__)) ).to_s.match /(.*?)ter/
    @this_here = @this_here[0]

    $other_here = $nome_da_conta



    file = File.new(((@this_here + "\\Accounts\\" + name_return + "\\textos\\guardados\\" + $new_txt_name + ".dgtxt").to_s), "w")
    file.close


    File.open((@this_here + "\\Accounts\\" + name_return + "\\textos\\guardados\\" + $new_txt_name + ".dgtxt"), "w") do |file|
      file << @really_text
    end
    begin
      @doc["doc"] << $new_txt_name
    rescue
      sleep 0.70
      @doc["doc"] << $new_txt_name
    ensure
      if ( @doc["doc"].include? $new_txt_name ) == false
        @doc["doc"] << $new_txt_name
      end
    end
    File.open(@@file_socket, "w") do |file|
      file.puts YAML.dump(@@info_past)
    end
  end

  #retornar o texto selecionado
  def return_the_txt(text_selected_named)
    all_texto_letters = YAML.load(File.open(".\\Accounts\\" + name_return + "\\textos\\guardados\\" + text_selected_named.to_s + ".dgtxt"))
    return all_texto_letters
  end

  #deletar textos
end

=begin
                Example:


				conta_now = DataAcc.new(".\\example.yml")
        senha = conta_now.password_return <!-- retorna senha
	     nome = conta_now.name_return <!-- retorna nome


=end
