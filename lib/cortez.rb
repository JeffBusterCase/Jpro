# encoding: CP850




=begin
0	desativa todos os atributos
1	ativa o modo brilho
4	ativa o modo sublinhado
5	ativa o modo pisca-pisca
7	troca a cor do primeiro plano pela cor de fundo
8	oculta o texto (cor do texto igual ao do fundo)
30	texto na cor preta                                     certo
31	texto na cor vermelha                                  certo
32	texto na cor verde                                     certo
33	texto na cor amarela
34	texto na cor azul
35	texto na cor magenta
36	texto na cor ciano
37	texto na cor branca
39	texto na cor padrão
40	fundo na cor preta
41	fundo na cor vermelha
42	fundo na cor verde
43	fundo na cor amarela
44	fundo na cor azul
45	fundo na cor magenta
46	fundo na cor ciano
47	fundo na cor branca
49	fundo na cor padrão
=end


def colorize(text, color_code)
   "#{color_code}#{text}\e[0m"
end
 


def off(text)
  colorize(text, "\e[0m")
end


def wa(text)
  colorize(text, "\e[1m")
end


def sbl(text)
  colorize(text, "\e[4m")
end

def psp(text)
  colorize(text, "\e[5m")
end


def trc(text)
  colorize(text, "\e[7m")
end


def spy(text)
  colorize(text, "\e[8m")
end

def red(text)
  colorize(text, "\e[31m")
end

def green(text)
  colorize(text, "\e[32m")
end

def black(text)
  colorize(text, "\e[30m")
end

def yellow(text)
  colorize(text, "\e[33m")
end

def blue(text)
  colorize(text, "\e[34m")
end

def mag(text)
  colorize(text, "\e[35m")
end

def cian(text)
  colorize(text, "\e[36m")
end


def whi(text)
  colorize(text, "\e[37m")
end

def pad(text)
  colorize(text, "\e[39m")
end



def fblack(text)
  colorize(text, "\e[40m")
end


def fred(text)
  colorize(text, "\e[41m")
end

def fgreen(text)
  colorize(text, "\e[42m")
end

def fyellow(text)
  colorize(text, "\e[43m")
end

def fblue(text)
  colorize(text, "\e[44m")
end


def fmag(text) #magenta
  colorize(text, "\e[45m")
end


def fcian(text)
  colorize(text, "\e[46m")
end

def fw(text) #branco
  colorize(text, "\e[47m")
end


def fpad(text)
  colorize(text, "\e[48m")
end




=begin


Exemplo:

  puts "[#{fred("Hello")}]"


Isso é uma String --> #{fred("Hello")}


=end




