class_name ItemFerramenta;
extends ItemBase

@export var DANO: int;
@export var DURABILIDADE: int;
@export var DURABILIDADE_MAXIMA: int;
@export var TIPO : String;
@export var EFEITO: String;


func construtor(Textura: CompressedTexture2D, Nome: String, Dano: int, Durabilidade: int, Durabilidada_Maxima: int, Tipo: String, Efeito: String,Quantidade: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	DANO = Dano;
	DURABILIDADE = Durabilidade;
	DURABILIDADE_MAXIMA = Durabilidada_Maxima;
	TIPO = Tipo;
	EFEITO = Efeito;
	QUANTIDADE = Quantidade;
	
