extends Control

var font: FontFile = preload("res://resource/fonts/alagard.ttf");
var saves: Array = [];
var float_open: bool = false;

func _ready() -> void:
	atualizar_saves();


func atualizar_saves() -> void:
	for x in range($MenuMapas/Body/Content.get_child_count()):
		$MenuMapas/Body/Content.get_child(x).queue_free();
	
	var saves: Array = ControladorSave.pegar_saves();
	if (saves != []):
		ler_saves(saves);


func criar_button(Nome: String) -> void:
	var btn : Button = Button.new();
	btn.theme = preload("res://resource/temas/inicio.tres");
	btn.text = Nome;
	$MenuMapas/Body/Content.add_child(btn);


func ler_saves(Saves: Array) -> void:
	for x in Saves:
		if (x is String):
			criar_button(x);


func _on_button_pressed():
	if (float_open == false):
		var criarmapa = preload("res://assets/Dialogo/criar_mapa.tscn").instantiate();
		criarmapa.connect("MundoCriado", fechou);
		criarmapa.connect("Fechou", cancelou);
		float_open = true;
		add_child(criarmapa);


func fechou():
	float_open = false;
	atualizar_saves();


func cancelou():
	float_open = false;
