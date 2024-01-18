class_name MundoSet;
extends Node2D;

#Signal

#Propriedades
@export var NumeroAndar: int;
var Layer: Array = [];


#Recursos - Iniciar
func _init() -> void:
	if (NumeroAndar != null):
		var layerX: Array = [];
		Layer.append(layerX);


static func novo(numeroAndar: int) -> MundoSet:
	var saida: MundoSet = MundoSet.new();
	saida.NumeroAndar = numeroAndar;
	return saida;


#Recursos Principais
func colocar_bloco(Obj: Bloco) -> bool:
	var n: int = 0;
	for x in Layer:
		if (x == Layer[0]):
			n = x.size();
		elif (n > x.size()):
			x[x.size() + 1] = Obj;
			n = x.size();
			return true;
	return false;


func setar_bloco(Obj: Bloco, Localizacao: Vector2i) -> void:
	Obj.LOCAL = Localizacao;
	Layer[Localizacao.x][Localizacao.y] = Obj;


func atualizar_unico(Loc: Vector2i) -> bool:
	if (Layer[Loc.x][Loc.y] != null):
		var tipo = Layer[Loc.x][Loc.y].Tipo;
		var num: Array = [
			Vector2i(Loc.x -1, Loc.y -1), Vector2i(Loc.x, Loc.y -1), Vector2i(Loc.x + 1, Loc.y -1),
			Vector2i(Loc.x -1, Loc.y), Vector2i(Loc.x +1, Loc.y),
			Vector2i(Loc.x -1, Loc.x + 1), Vector2i(Loc.x, Loc.y + 1), Vector2i(Loc.x -1, Loc.y +1)
		];
		
		if ():
			
			return true;
		
