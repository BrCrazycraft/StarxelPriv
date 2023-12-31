class_name Status;
extends Node;

var DANO: int;
var DANO_MAXIMO: int;
var DANO_CRITICO: int;
var TAXA: int;
var TAXA_MAXIMA: int;
var TIPO_DANO: String;
var HP: int;
var VIDA_MAXIMA: int;
var DEFESA: int;
var DEFESA_MAXIMA: int;
var PROTECAO: int;
var PROTECAO_MAXIMA: int;
var VELOCIDADE: int;
var VELOCIDADE_MAXIMA: int;

func carregar(Dicionario: Dictionary) -> void:
	DANO = Dicionario["PLAYER_DANO"];
	DANO_MAXIMO = Dicionario["PLAYER_DANO"];
	DANO_CRITICO = Dicionario["PLAYER_CRITICO"];
	TAXA = Dicionario["PLAYER_TAXA"];
	TAXA_MAXIMA = Dicionario["PLAYER_TAXA"];
	TIPO_DANO = Dicionario["PLAYER_TIPO_DANO"];
	HP = Dicionario["PLAYER_VIDA"];
	VIDA_MAXIMA = Dicionario["PLAYER_VIDA"];
	DEFESA = Dicionario["PLAYER_DEFESA"];
	DEFESA_MAXIMA = Dicionario["PLAYER_DEFESA"];
	PROTECAO = Dicionario["PLAYER_PROTECAO"];
	PROTECAO_MAXIMA = Dicionario["PLAYER_PROTECAO"];


func diocionario() -> Dictionary:
	return {
		"PLAYER_HP": VIDA_MAXIMA,
		"PLAYER_DEFESA": DEFESA_MAXIMA,
		"PLAYER_PROTECAO": PROTECAO_MAXIMA,
		"PLAYER_DANO": DANO,
		"PLAYER_CRITICO": DANO_CRITICO,
		"PLAYER_TAXA_CRITICA": TAXA,
		"PLAYER_TIPO_DANO": TIPO_DANO,
	};


func sofreu(Tipo: String, Quantidade: int) -> bool:
	if (Tipo == "CRITICO" or Tipo == "NORMAL"):
		HP -= (Quantidade - DEFESA);
	elif (Tipo == "MAGICO"):
		HP -= (Quantidade - PROTECAO);
	elif (Tipo == "REAL"):
		HP -= Quantidade;
	
	if (HP <= 0):
		return true;
	return false;



func bonus_dano() -> int:
	if (TAXA > 100):
		return (TAXA - 100) * DANO_CRITICO;
	return 0;


func causar_dano() -> Array:
	randomize();
	var critico: int = randi_range(1, 100);
	
	if (TAXA >= critico):
		return ["CRITICO", (DANO * DANO_CRITICO) + bonus_dano()];
	return [TIPO_DANO, DANO];


func curar(Quantidade: int) -> void:
	if (Quantidade + HP >= VIDA_MAXIMA):
		HP = VIDA_MAXIMA;
	else:
		HP += Quantidade;
