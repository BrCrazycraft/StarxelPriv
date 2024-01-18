class_name ItemMunicao;
extends Item;

#Propriedades
@export var QUANTIDADE: int;
@export var ESTILO: String;
@export var EFEITO: String;
@export var VALOR: int;
@export var DANO: int;


#Recursos
func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Quantidade: int, Estilo: String, Efeito: String, Valor: int, Dano: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	QUANTIDADE = Quantidade;
	ESTILO = Estilo;
	EFEITO = Efeito;
	VALOR = Valor;
	DANO = Dano;


func encode() -> Dictionary:
	var exit: Dictionary = {
		"ID": "ItemMunicao",
		"Textura": TEXTURA.resource_path,
		"Nome": NOME,
		"Tipo": TIPO,
		"Quantidade": QUANTIDADE,
		"Estilo": ESTILO,
		"Efeito": EFEITO,
		"Valor": VALOR,
		"Dano": DANO
	};
	return exit;


func decode(Dicionario: Dictionary) -> void:
	if (Dicionario["ID"] != null and Dicionario["ID"] == "ItemMunicao"):
		TEXTURA = load(Dicionario["Textura"]);
		NOME = Dicionario["Nome"];
		TIPO = Dicionario["Tipo"];
		QUANTIDADE = Dicionario["Quantidade"];
		ESTILO = Dicionario["Estilo"];
		EFEITO = Dicionario["Efeito"];
		VALOR = Dicionario["Valor"];
		DANO = Dicionario["Dano"];


func pegar_Tipo() -> String:
	return "ItemMunicao";
