class_name Slot;
extends Button;

#Sinais



#Propriedades
var TEXTURA: CompressedTexture2D;
var NOME: String;
var DURABILIDADE: String;
var EFEITO: String;
var QUANTIDADE: int;
var QUANTIDADE_MAXIAM: int;
var TIPO: String;
var ID: int;


#Recursos
func _init(Textura: CompressedTexture2D) -> void:
	icon = Textura;
	size = Textura.get_size();
	scale = Vector2(2, 2);
