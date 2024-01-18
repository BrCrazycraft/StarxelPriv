class_name  Bloco;
extends Sprite2D;

#Propriedades
@export var Tipo: String;
@export var Parte: int;
@export var Semelhantes: Array;
@export var Vida: int;
@export var Drop: Item;
var LOCAL: Vector2i;


#Recursos
func novo(tex: CompressedTexture2D, tipo: String, pos: int, semelhante: Array, vida: int, drop: Item) -> Bloco:
	var saida: Bloco = Bloco.new();
	texture = tex;
	saida.Tipo = tipo;
	saida.Parte = pos;
	saida.Semelhantes = semelhante;
	saida.Vida = vida;
	saida.Drop = drop;
	
	return saida;
	pass


func verificar(Bl: Bloco) -> bool:
	if (Bl == null): return true;
	if (Tipo == Bl.Tipo and Parte == Bl.Parte): return true;
	return false;
