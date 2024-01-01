class_name Slot;
extends Button;

#Sinais
signal clicou(item: ItemBase, id: int);


#Propriedades
var TEXTURA: CompressedTexture2D;
var NOME: String;
var QUANTIDADE: int;
var QUANTIDADE_MAXIAMA: int;
var ID: int;
var ITEM: ItemBase;


#Recursos
func _init(Textura: CompressedTexture2D, Id: int, Max: int) -> void:
	icon = Textura;
	size = Textura.get_size();
	ID = Id;
	QUANTIDADE_MAXIAMA = Max;


func adicionar_vazio(Res: ItemBase) -> void:
	NOME = Res.NOME;
	QUANTIDADE = Res.QUANTIDADE;
	TEXTURA = Res.TEXTURA;
	if (!Res is ItemBase):
		ITEM = Res;
	else:
		ITEM == null;
	mudar_item();


func limpar() -> void:
	TEXTURA  = null;
	NOME = "";
	QUANTIDADE = -1;
	ITEM = null;
	mudar_item();


func remover() -> ItemBase:
	if (ITEM == null):
		var exit: ItemBase = ItemBase.new();
		exit.novo(TEXTURA, NOME, QUANTIDADE);
		limpar();
		return exit;
	elif (ITEM is ItemBloco):
		var exit: ItemBloco = ItemBloco.new();
		exit.construtor(TEXTURA, ITEM.TEXTURA_CHAO, NOME, ITEM.RESISTENCIA, QUANTIDADE)
		limpar();
		return exit;
	elif (ITEM is ItemFerramenta):
		var exit: ItemFerramenta = ItemFerramenta.new();
		exit.construtor(TEXTURA, NOME, ITEM.DANO, ITEM.DURABILIDADE, ITEM.DURABILIDADE_MAXIMA,ITEM.TIPO, ITEM.EFEITO , QUANTIDADE);
		limpar();
		return exit;
	return null;


func adicionar_quantidade(valor: int) -> bool:
	if ((valor + QUANTIDADE) <= QUANTIDADE_MAXIAMA):
		QUANTIDADE += valor;
		return true;
	return false;


func e_adicionavel(Res: ItemBase) -> bool:
	if (NOME == "" and ITEM == null):
		return true;
	
	if (Res is ItemFerramenta):
		return false;
	
	if (((Res.QUANTIDADE + QUANTIDADE) <= QUANTIDADE_MAXIAMA) and (NOME == Res.NOME)):
		return true;
	return false;


func atualizar() -> void:
	if (ITEM is ItemFerramenta):
		get_child(0).atualizar(ITEM.DURABILIDADE);
	else:
		get_child(0).atualizar(ITEM.QUANTIDADE);


func mudar_item() -> void:
	if (NOME != ""):
		if (ITEM is ItemFerramenta):
			get_child(0).criar(true, ITEM.DURABILIDADE, ITEM.DURABILIDADE_MAXIMA, TEXTURA);
		else:
			get_child(0).criar(false, QUANTIDADE, 0, TEXTURA);
	else:
		get_child(0).limpar();


#Funções
func _ready() -> void:
	connect("pressed", click);
	var Sprite = preload("res://functions/inventario/sistema/ItemTexture.tscn").instantiate();
	add_child(Sprite);


func click() -> void:
	if (NOME != ""):
		clicou.emit(remover(), ID);
