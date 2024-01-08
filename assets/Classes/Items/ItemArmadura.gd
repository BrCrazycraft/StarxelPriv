class_name ItemArmadura;
extends Item;

@export var DEFESA: int;
@export var ESTILO: String;


func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Defesa: int, Estilo: String) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	ESTILO = Estilo;
