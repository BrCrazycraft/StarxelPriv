class_name ItemFerramenta;
extends Item;

#Propriedades
@export var PROPRIEDADE: String;
@export var DURABILIDADE: int;
@export var FORCA: int;


#Recursos
func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Propriedade: String, Durabilidade: int, Forca: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	PROPRIEDADE = Propriedade;
	DURABILIDADE = Durabilidade;
	FORCA = Forca;


func encode() -> Dictionary:
	var exit: Dictionary = {
		"ID": "ItemFerramenta",
		"Textura": TEXTURA.resource_path,
		"Nome": NOME,
		"Tipo": TIPO,
		"Propriedade": PROPRIEDADE,
		"Durabilidade": DURABILIDADE,
		"Forca": FORCA
	};
	return exit;


func decode(Dicionario: Dictionary) -> void:
	if (Dicionario["ID"] != null and Dicionario["ID"] == "ItemFerramenta"):
		TEXTURA = load(Dicionario["Textura"]);
		NOME = Dicionario["Nome"];
		TIPO = Dicionario["Tipo"];
		PROPRIEDADE = Dicionario["Propriedade"];
		DURABILIDADE = Dicionario["Durabilidade"];
		FORCA = Dicionario["Forca"];


func pegar_Tipo() -> String:
	return "ItemFerramenta";
