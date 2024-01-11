class_name Entidade;
extends Node;

#Sinais
signal TomouDano(dano: int, tipo: int);
signal SeCurou(cura: int);
signal Morreu();

#Propriedades
var NOME: String;
var Vida: int;
var VidaMaxima: int;
var Defesa: int;
var DefesaMaxima: int;
var Protecao: int;
var ProtecaoMaxima: int;

#Recursos
func _init() -> void:
	pass


func reset_int(vida: int, defesa: int, protecao: int) -> void:
	Vida = vida;
	VidaMaxima = vida;
	Defesa = defesa;
	DefesaMaxima = defesa;
	Protecao = protecao;
	ProtecaoMaxima = protecao;


func salvar() -> Dictionary:
	var exit : Dictionary = {
		"Vida": Vida,
		"VidaMaxima": VidaMaxima,
		"Defesa": Defesa,
		"DefesaMaxima": DefesaMaxima,
		"Protecao": Protecao,
		"ProtecaoMaxima": ProtecaoMaxima
	};
	
	return exit;

func carregar(dicionario: Dictionary) -> bool:
	if (dicionario != null):
		if (dicionario["Vida"] != null):
			Vida = dicionario["Vida"];
		if (dicionario["VidaMaxima"] != null):
			VidaMaxima = dicionario["VidaMaxima"]; 
		if (dicionario["Defesa"] != null):
			Defesa = dicionario["Defesa"]; 
		if (dicionario["DefesaMaxima"] != null):
			DefesaMaxima = dicionario["DefesaMaxima"]; 
		if (dicionario["Protecao"] != null):
			Protecao = dicionario["Protecao"]; 
		if (dicionario["ProtecaoMaxima"] != null):
			ProtecaoMaxima = dicionario["ProtecaoMaxima"]; 
	
	if ((Vida != null and VidaMaxima != null) and (DefesaMaxima != null and Defesa != null) and (Protecao != null and ProtecaoMaxima != null)):
		return true;
	print_debug("Entidade[carreger(", dicionario,")]: Dicionario com funções vazias");
	return false;



#Funções
func curar(cura: int) -> void:
	if (cura + Vida <= VidaMaxima):
		Vida = VidaMaxima;
	else:
		Vida += cura;
	SeCurou.emit(cura);


func sofrerDano(tipo: String, dano: int) -> void:
	var damage: int = 0;
	if (tipo == "DanoReal"):
		damage = dano;
		Vida -= damage;
	elif (tipo == "DanoFisico"):
		damage = (dano - Defesa);
		Vida -= damage;
	elif (tipo == "DanoMagico"):
		damage = (dano - Protecao);
		Vida -= damage;
	elif (tipo == "DanoMisto"):
		if (Defesa >= Protecao):
			damage = (dano - Protecao);
			Vida -= damage;
		else:
			damage = (dano - Defesa);
			Vida -= damage;
	
	TomouDano.emit(damage, tipo);
	
	if (Vida <= 0):
		Morreu.emit();
