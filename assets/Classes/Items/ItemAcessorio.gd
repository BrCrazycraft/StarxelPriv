class_name ItemAcessorio;
extends Item;

#Propriedades
@export var ESTILO: String;
@export var EFEITO: String;
@export var VALOR: int;

#Recursos
func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Estilo: String, Efeito: String, Valor: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	ESTILO = Estilo;
	EFEITO = Efeito;
	VALOR = Valor;


func encode() -> Dictionary:
	var exit: Dictionary = {
		"ID": "ItemAcessorio",
		"Textura": TEXTURA.resource_path,
		"Nome": NOME,
		"Tipo": TIPO,
		"Estilo": ESTILO,
		"Efeito": EFEITO,
		"Valor": VALOR
	};
	return exit;


func decode(Dicionario: Dictionary) -> void:
	if (Dicionario["ID"] != null and Dicionario["ID"] == "ItemAcessorio"):
		TEXTURA = load(Dicionario["Textura"]);
		NOME = Dicionario["Nome"];
		TIPO = Dicionario["Tipo"];
		ESTILO = Dicionario["Estilo"];
		EFEITO = Dicionario["Efeito"];
		VALOR = Dicionario["Valor"];


func pegar_Tipo() -> String:
	return "ItemAcessorio";
