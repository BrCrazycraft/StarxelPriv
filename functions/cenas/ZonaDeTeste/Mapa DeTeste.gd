extends Node2D

@onready var inv = Inventario.new(Vector2(6, 1), 64);

func _ready() -> void:
	$AreaInventario.adicionar(inv)
