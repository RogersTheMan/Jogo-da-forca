require_relative 'ui'
require_relative 'rank'

def escolhe_palavra
    escolhendo_palavra
    arquivo = File.new("dicionario.txt")
    qtd_palavras = arquivo.gets.to_i
    numero_escolhido = rand(qtd_palavras)
    for linha in 1..(numero_escolhido - 1)
        arquivo.gets
    end
    palavra_secreta = arquivo.gets.chomp.downcase
    arquivo.close
    palavra_escolhida(palavra_secreta)
end

def palavra_mascarada(chutes,palavra_secreta)
    mascara = ""
    for letra in palavra_secreta.chars
        if chutes.include? letra
            mascara << letra
        else
            mascara << "_"
        end
    end
    mascara
end

def pede_chute_valido(chutes,erros,mascara)
    cabecalho_tentativa(chutes,erros,mascara)
    loop do
        chute = pede_um_chute
        if chutes.include? chute
            avisa_chute_efetuado(chute)
        else
            return chute
        end
    end
end

def joga nome
    palavra_secreta = escolhe_palavra  
    erros = 0
    chutes = []
    pontos = 100
    
    while erros < 5
        mascara = palavra_mascarada(chutes,palavra_secreta)
        chute = pede_chute_valido(chutes,erros,mascara)
        chutes << chute
        if chute.size == 1
            letra_procurada = chute[0]
            total_encontrado = palavra_secreta.count(letra_procurada)
            if total_encontrado == 0
                avisa_letra_nao_encontrada
                erros += 1
                pontos -= 20
            else
                avisa_letra_encontrada(total_encontrado)
            end
        else
            if chute == palavra_secreta
                acertou
                break
            end
        end
    end
    final(palavra_secreta, pontos)
    pontos
end



def jogo_forca
    nome = boas_vindas
    pontos_totais = 0

    avisa_campeao(le_rank)

    loop do
        pontos_totais += joga nome
        avisa_pontos_totais(pontos_totais)
        if le_rank[1].to_i < pontos_totais
            salva_rank(nome,pontos_totais)
        end
        if !quer_jogar
            break
        end 
    end
end