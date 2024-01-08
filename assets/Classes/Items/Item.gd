class_name Item;
extends Resource

#Propriedades
@export var TEXTURA: CompressedTexture2D;
@export var NOME: String;
@export var TIPO: String;

#Propriedades
func construtor(Textura: CompressedTexture2D, Nome: String, Tipo: String) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
