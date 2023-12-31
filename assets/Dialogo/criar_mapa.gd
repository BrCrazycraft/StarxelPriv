extends GridContainer;

signal MundoCriado();
signal Fechou();

func _ready():
	print("Criou");

func _on_excutar_pressed() -> void:
	if ($Nome.text != ""):
		var err = ControladorSave.criar_saves($Nome.text);
		if (err == true):
			MundoCriado.emit();
			queue_free();


func _on_sair_pressed():
	Fechou.emit();
	queue_free();
