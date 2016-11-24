#!/usr/bin/env ruby

require 'rubygems'
require 'rtesseract'
require 'mini_magick'


def inicio(files = loadImage )
	arquivoEscolhido = numeroRandomico(qtdadeItem)
	retorno = retornoImagem(arqSorteado(arquivoEscolhido)).to_s
	mensagemUsuario(arquivoEscolhido,retorno)
end

# Importa todos os arquivos q estao no diretorio captchas 
def loadImage
	@files = Dir["captchas/******.jpg"]
end

def qtdadeItem
	@files.length
end

def numeroRandomico(totalRegistro)
 rand(totalRegistro)
end

def arqSorteado(registro)
	@files[registro]
end

# RTesseract => Gem (biblioteca) responsavel por wrapping do tesseract com imagemagick 
def retornoImagem(registro)
	@img = RTesseract.new(registro, {processor: "mini_magick", psm: 9, lang: "eng" } )
end

def mensagemUsuario(arquivoEscolhido,teste)
	puts "ha #{qtdadeItem} itens na pasta captcha"
	puts "O arquivo escolhido para retorno do texto foi: #{arquivoEscolhido} - #{arqSorteado(arquivoEscolhido)}"
	puts "Criado um pdf com a imagem do arquivo em #{retornoImagem(arqSorteado(arquivoEscolhido)).to_pdf} para verificação "
	puts " O Retorno para o captcha foi: #{teste}"
end


# chama o inicio do script
inicio




