extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	ControladorSave.Carregar_Teste();
	var Inv: InventarioBau = InventarioBau.new(preload("res://resource/texturas/inventario/Slots/Invatario_Slot.png"), 32, Vector2(4, 4), "Bau1");
	$CanvasLayer/PlayerInventario.adicionar_inventario(Inv);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		pass
	pass
