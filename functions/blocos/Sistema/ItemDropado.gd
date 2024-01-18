class_name ItemDropado;
extends Area2D;

#Propriedades
@export var ITEM: Item;
var Shape: CollisionShape2D = CollisionShape2D.new();
var Textura: Sprite2D = Sprite2D.new();

#Recursos - Construtores
func _init() -> void:
	construir_Filhos();
	connect("body_entered", _body_entered);


static func novo(Itm: Item) -> ItemDropado:
	var novo: ItemDropado = ItemDropado.new();
	novo.ITEM = Itm;
	novo.Textura.texture = Itm.TEXTURA;
	return novo;



func construir_Filhos() -> void:
	var obj = RectangleShape2D.new();
	obj.size = Vector2(32, 32);
	Shape.shape = obj;
	add_child(Shape);
	add_child(Textura);


#Propriedades
func _ready() -> void:
	Textura.texture = ITEM.TEXTURA;

func _body_entered(body) -> void:
	if (body.name == "Jogador"):
		body.coletou.emit(self);
