class_name ItemArmadura;
extends Item;

@export var DEFESA: int;
@export var ESTILO: String;


func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Defesa: int, Estilo: String) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	ESTILO = Estilo;


func encode() -> Dictionary:
	var exit: Dictionary = {
		"ID": "ItemArmadura",
		"Textura": TEXTURA.resource_path,
		"Nome": NOME,
		"Tipo": TIPO,
		"Defesa": DEFESA,
		"Estilo": ESTILO
	};
	return exit;


func decode(Dicionario: Dictionary) -> void:
	if (Dicionario["ID"] != null and Dicionario["ID"] == "ItemArmadura"):
		TEXTURA = load(Dicionario["Textura"]);
		NOME = Dicionario["Nome"];
		TIPO = Dicionario["Tipo"];
		DEFESA = Dicionario["Defesa"];
		ESTILO = Dicionario["Estilo"];
