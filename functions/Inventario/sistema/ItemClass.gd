class_name ItemBase;
extends Resource;

@export var TEXTURA: CompressedTexture2D;
@export var NOME: String;
@export var QUANTIDADE: int;


func novo(Textura: CompressedTexture2D, Nome: String, Quantidade: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	QUANTIDADE = Quantidade;
