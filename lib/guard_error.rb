#guard the errors in a file


def guard_error (label=nil, alert=false)
  labelr = label
  case label
  when 0
    label = "_in_text"
  when 1
    label = "_undefined_local"
  when 2
    label = "_in_login"
  when 3
    label = "_in_session"
  when 4
    label = "_in_bin_path"
  when 5
    label = "_in_read_txt"
  when 6
    label = "_in_create_accout"
  when 7
    label = "_something_goes_wrong"
  else
    label = "_undefined_label"
  end
  
  $error_name = "error_" << rand(100).to_s << " " << rand(100).to_s << label
  file_error_name2 = ("../lib/erros/" << $error_name << ".txt")
  grand = File.new(file_error_name2, "w")
  grand.close
  File.open(file_error_name2, "w") do |file|
    file.puts Time.now.to_s,
              "\n\n",
              $!,
              "\n\n"
              $!.message
    $!.backtrace.each { |part|
      file.puts part
    }
  end
  if alert == true
    $os.clear
    9.times {puts ""}
    puts "                          Erro nº: " + $error_name,
         "\n\n                                 #{easyMessage(labelr)}",
         "Wait 4 seconds...."
    sleep 4
    $os.clear
  else
    $os.clear
  end
end
