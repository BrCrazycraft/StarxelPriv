class_name ItemFerramenta;
extends ItemBase

@export var DANO: int;
@export var DURABILIDADE: int;
@export var TIPO : String;
@export var EFEITO: String;


func construtor(Textura: CompressedTexture2D, Nome: String, Dano: int, Durabilidade: int, Tipo: String, Efeito: String,Quantidade: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	DANO = Dano;
	DURABILIDADE = Durabilidade;
	TIPO = Tipo;
	EFEITO = Efeito;
	QUANTIDADE = Quantidade;
	
