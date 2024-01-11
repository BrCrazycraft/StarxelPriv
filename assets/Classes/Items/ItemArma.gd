class_name ItemArma;
extends Item;

#Propriedades
@export var ESTILO: String;
@export var DANO: int;
@export var EFEITO: String;
@export var VALOR: int;
@export var ALCANCE: float;
@export var CUSTO: String;


#Recursos
func novo(Textura: CompressedTexture2D, Nome: String, Tipo: String, Estilo: String, Dano: int, Efeito: String, Alcance: float, Custo: String, Valor: int) -> void:
	TEXTURA = Textura;
	NOME = Nome;
	TIPO = Tipo;
	ESTILO = Estilo;
	DANO = Dano;
	EFEITO = Efeito;
	ALCANCE = Alcance;
	CUSTO = Custo;
	VALOR = Valor;


func encode() -> Dictionary:
	var exit: Dictionary = {
		"ID": "ItemArma",
		"Textura": TEXTURA.resource_path,
		"Nome": NOME,
		"Tipo": TIPO,
		"Estilo": ESTILO,
		"Dano": DANO,
		"Efeito": EFEITO,
		"Alcance": ALCANCE,
		"Custo": CUSTO,
		"Valor": VALOR
	};
	return exit;


func decode(Dicionario: Dictionary) -> void:
	if (Dicionario["ID"] != null and Dicionario["ID"] == "ItemArma"):
		TEXTURA = load(Dicionario["Textura"]);
		NOME = Dicionario["Nome"];
		TIPO = Dicionario["Tipo"];
		ESTILO = Dicionario["Estilo"];
		DANO = Dicionario["Dano"];
		EFEITO = Dicionario["Efeito"];
		ALCANCE = Dicionario["Alcance"];
		CUSTO = Dicionario["Custo"];
		VALOR = Dicionario["Valor"];
