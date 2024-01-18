class_name Array2D;

#Propriedades
var Core: Array = [];
var Size: int = 0;


#Recursos
func _init(vetor: Vector2) -> void:
	for x in vetor.x:
		var novo: Array = [];
		for y in vetor.y:
			novo.append("");
			Size += 1;
		Core.append(novo);


func append(Obj: Object) -> bool:
	if (full() == true): return false;
	for x in Core:
		for y in x:
			if (y == ""):
				y = Obj;
				return true;
	print_debug("<Error@Array2D> append(", Obj,")");
	return false;
	



func has_cord(vec: Vector2) -> bool:
	if (Core[vec.x][vec.y] == null): return false;
	return true;


func empty() -> bool:
	for x in Core:
		for y in x:
			if (y != ""):
				return true;
	return false;


func full() -> bool:
	for x in Core:
		for y in x:
			if (y == ""):
				return false;
	return true;
