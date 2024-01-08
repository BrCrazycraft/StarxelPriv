class_name ItemMaterial;
extends Item;

@export var QUANTIDADE: int;


#Propriedades
func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Quantidade: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	QUANTIDADE = Quantidade;
