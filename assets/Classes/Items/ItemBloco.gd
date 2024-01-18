class_name ItemBloco;
extends Item;

@export var QUANTIDADE: int;
@export var CAMINHO: String;


func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Quantidade: int, Caminho: String) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	QUANTIDADE = Quantidade;
	CAMINHO = Caminho;


func encode() -> Dictionary:
	var exit: Dictionary = {
		"ID": "ItemBloco",
		"Textura": TEXTURA.resource_path,
		"Nome": NOME,
		"Tipo": TIPO,
		"Quantidade": QUANTIDADE,
		"Caminho": CAMINHO
	};
	return exit;


func decode(Dicionario: Dictionary) -> void:
	if (Dicionario["ID"] != null and Dicionario["ID"] == "ItemBloco"):
		TEXTURA = load(Dicionario["Textura"]);
		NOME = Dicionario["Nome"];
		TIPO = Dicionario["Tipo"];
		QUANTIDADE = Dicionario["Quantidade"];
		CAMINHO = Dicionario["Caminho"];


func pegar_Tipo() -> String:
	return "ItemBloco";
