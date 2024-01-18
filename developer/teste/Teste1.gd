extends Node2D;




func _ready():
	$CanvasLayer/PlayerInventario.connect("ItemEquipado", equipou);
	$Jogador.equipar(load("res://functions/inventario/Armas/Espada.tres"));
	pass


func equipou(Novo: Item) -> void:
	$Jogador.equipar(Novo);


func _on_jogador_coletou(Itm):
	$CanvasLayer/PlayerInventario.adicionarMochila(Itm);
