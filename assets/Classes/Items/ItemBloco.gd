class_name ItemBloco;
extends Item;

@export var QUANTIDADE: int;
@export var CAMINHO: String;


func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Quantidade: int, Caminho: String) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	QUANTIDADE = Quantidade;
	CAMINHO = Caminho;
