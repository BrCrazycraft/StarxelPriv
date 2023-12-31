class_name ItemBloco;
extends ItemBase;

@export var TEXTURA_CHAO: CompressedTexture2D;
@export var RESISTENCIA: int;

func construtor(Textura: CompressedTexture2D, Chao: CompressedTexture2D, Nome: String, Resistencia: int,Quantidade: int) -> void:
	TEXTURA = Textura;
	TEXTURA_CHAO = Chao;
	NOME = Nome;
	RESISTENCIA = Resistencia;
	QUANTIDADE = Quantidade;
