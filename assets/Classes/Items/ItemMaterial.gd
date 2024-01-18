class_name ItemMaterial;
extends Item;

@export var QUANTIDADE: int;


#Propriedades
func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Quantidade: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	QUANTIDADE = Quantidade;


func encode() -> Dictionary:
	var exit: Dictionary = {
		"ID": "ItemMaterial",
		"Textura": TEXTURA.resource_path,
		"Nome": NOME,
		"Tipo": TIPO,
		"Quantidade": QUANTIDADE
	};
	return exit;


func decode(Dicionario: Dictionary) -> void:
	if (Dicionario["ID"] != null and Dicionario["ID"] == "ItemMaterial"):
		TEXTURA = load(Dicionario["Textura"]);
		NOME = Dicionario["Nome"];
		TIPO = Dicionario["Tipo"];
		QUANTIDADE = Dicionario["Quantidade"];


func pegar_Tipo() -> String:
	return "ItemMaterial";
