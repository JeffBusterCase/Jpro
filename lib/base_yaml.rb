# encoding: CP850



require 'yaml'

class Changer
  def initialize(file_name)
    @@file_name = file_name
	  @@file_yaml = YAML.load(File.open(@@file_name))
  end
  
  def change(cep, new_value)
    cep_real = cep.to_s.length
    @file_time = [@@file_name, new_value]
    if cep_real > 1
      cep.to_s.each_char do |s|
        @temper = []
        @temper << s
      end
      load_and_save()
    else
      @temper = cep.to_i
      load_and_save()
    end
  end
  
  private
  def load_and_save(file_nm=@file_time[0])
    file_var = File.read(file_nm)
    file_array = YAML.load(file_var)
    file_array[@temper] = @file_time[1]
    File.open(file_nm, 'w+') do |new_file|
      new_file.puts YAML.dump(file_array)
    end
  end
end

