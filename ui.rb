def avisa_pontos_totais(pontos_totais)
    puts "Você possui #{pontos_totais} pontos!!"
end

def avisa_campeao(dados)
    puts "Nosso campeão atual é: #{dados[0]} com #{dados[1]} pontos}"
end

def boas_vindas
    puts "Bem vindo ao jogo de Forca"
    puts "Qual é o seu nome?"

    nome = gets.chomp

    puts "--------------------------------------------------"
    puts "O jogo já está pronto para começarmos, #{nome}"
    puts "--------------------------------------------------"
    nome
end

def desenha_forca(erros)
    cabeca = "   "
    bracos = "   "
    pernas = "   "
    corpo = " "

    if erros >= 1
        cabeca = "(_)"
    end
    if erros >= 2
        bracos = " | "
        corpo = "|"
    end
    if erros >= 3
        bracos = "/|\\ "
        corpo = "|"
    end
    if erros >= 4
        pernas = "/ \\"
    end

    puts "  ________          \n"
    puts " |/        |        \n"
    puts " |        #{cabeca}     \n" 
    puts " |        #{bracos}     \n" 
    puts " |         #{corpo}       \n"
    puts " |        #{pernas}      \n"
    puts " |                  \n"
    puts "_|___               \n"
    puts "\n\n"
end

def escolhendo_palavra
    puts "Escolhendo uma palavra secreta..."
end

def palavra_escolhida(palavra_secreta)
    puts "Palavra secreta com #{palavra_secreta.size} caracteres escolhida, tente adivinhá-la!"
    palavra_secreta
end

def cabecalho_tentativa(chutes,erros,mascara)
    desenha_forca(erros)
    puts "--------------------------------------------------"
    puts "Palavra secreta: #{mascara}"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
    puts "--------------------------------------------------"
end

def pede_um_chute
    puts "Entre com uma letra ou palavra!"
    chute = gets.chomp.downcase
    puts "--------------------------------------------------"
    puts "Será que acertou? Seu chute foi: '#{chute}'"
    chute
end

def avisa_chute_efetuado(chute)
    puts "Você já chutou '#{chute}'...Tente outra letra ou palavra!"
end

def avisa_letra_nao_encontrada
    puts "Letra não encontrada!"
end

def avisa_letra_encontrada(total_encontrado)
    puts "Letra encontrada #{total_encontrado} vezes!"
end

def acertou
    puts "Parabéns, você acertou!"
end

def final(palavra_secreta, pontos)
    puts "A palavra secreta era: #{palavra_secreta}"
    puts "Você terminou com #{pontos} pontos!"
end

def quer_jogar
    puts "--------------------------------------------------"
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.chomp
    quero_jogar.upcase == "S"
end