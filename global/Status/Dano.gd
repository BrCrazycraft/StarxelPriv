class_name DanoRecurso;
extends Resource;

var DANO: int;
var TIPO_DANO: String;

func _init(dano: int, tipo: String) -> void:
	DANO = dano;
	TIPO_DANO = tipo;
