class_name Item;
extends Resource

#Propriedades
@export var TEXTURA: CompressedTexture2D;
@export var NOME: String;
@export var TIPO: String;

#Recursos
func construtor(Textura: CompressedTexture2D, Nome: String, Tipo: String) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;


func encode() -> Dictionary:
	var exit: Dictionary = {
		"ID": "Item",
		"Textura": TEXTURA.resource_path,
		"Nome": NOME,
		"Tipo": TIPO
	};
	return exit;


func decode(Dicionario: Dictionary) -> void:
	if (Dicionario["ID"] != null and Dicionario["ID"] == "Item"):
		TEXTURA = load(Dicionario["Textura"]);
		NOME = Dicionario["Nome"];
		TIPO = Dicionario["Tipo"];


func pegar_Tipo() -> String:
	return "Item";


static func pegar_ID(ID: String) -> Item:
	if (ID == "Item"):
		return Item.new();
	elif (ID == "ItemMaterial"):
		return ItemMaterial.new();
	elif (ID == "ItemBloco"):
		return ItemBloco.new();
	elif (ID == "ItemArmadura"):
		return ItemArmadura.new();
	elif (ID == "ItemAcessorio"):
		return ItemAcessorio.new();
	elif (ID == "ItemArma"):
		return ItemArma.new();
	elif (ID == "ItemConsumivel"):
		return ItemConsumivel.new();
	elif (ID == "ItemMunicao"):
		return ItemMunicao.new();
	elif (ID == "ItemFerramenta"):
		return ItemFerramenta.new();
	elif (ID == "ItemArremessavel"):
		return ItemArremessavel.new();
	print_debug("Item[pegar_ID(", ID, ")]: ID invalido");
	return null;
