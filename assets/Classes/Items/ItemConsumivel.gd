class_name ItemConsumivel;
extends Item;

#Propriedades
@export var QUANTIDADE: int;
@export var EFEITO: String;
@export var VALOR: int;

#Recursos
func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Quantidade: int, Efeito: String, Valor: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	QUANTIDADE = Quantidade;
	EFEITO = Efeito;
	VALOR = Valor;


func encode() -> Dictionary:
	var exit: Dictionary = {
		"ID": "ItemConsumivel",
		"Textura": TEXTURA.resource_path,
		"Nome": NOME,
		"Tipo": TIPO,
		"Quantidade": QUANTIDADE,
		"Efeito": EFEITO,
		"Valor": VALOR
	};
	return exit;


func decode(Dicionario: Dictionary) -> void:
	if (Dicionario["ID"] != null and Dicionario["ID"] == "ItemConsumivel"):
		TEXTURA = load(Dicionario["Textura"]);
		NOME = Dicionario["Nome"];
		TIPO = Dicionario["Tipo"];
		QUANTIDADE = Dicionario["Quantidade"];
		EFEITO = Dicionario["Efeito"];
		VALOR = Dicionario["Valor"];
