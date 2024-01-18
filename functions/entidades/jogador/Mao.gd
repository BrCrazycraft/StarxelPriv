extends Area2D;

#Signal
signal ItemUsado(Equipda: Item, Durabilidade: int);

#Propriedades
@export var Equipado: Item;
var Atacando: bool = false;

#<Propriedades - Dano>
@export var Dano: int;
var DanoMaximo: int;
@export var VelocidadeDeAtaque: int;
var VelocidadeDeAtaqueMaxima: int;

#<Propriedades - Vital>
@export var Durabilidade: int;
var DurabilidadeMaxima: int;
var Quantidade: int;


#Recursos
func equipar_item(Itm: Item) -> void:
	esvaziar();
	if (Itm is ItemArma):
		Equipado = Itm;
		Dano = Itm.DANO;
		DanoMaximo = Itm.DANO;
		$Sprite2D.texture = Itm.TEXTURA;
		setar_usavel();
	elif (Itm is ItemFerramenta):
		Equipado = Itm;
		Durabilidade = Itm.DURABILIDADE;
		DurabilidadeMaxima = Itm.DURABILIDADE;
		$Sprite2D.texture = Itm.TEXTURA;	
		setar_usavel();
	elif (Itm is ItemArremessavel or Itm is ItemBloco):
		Equipado = Itm;
		Quantidade = Itm.QUANTIDADE;
		setar_colocavel();
	else:
		$Sprite2D.hide();
		$HitBox/AnimatedSprite2D.hide();
		Input.set_custom_mouse_cursor(null);


func setar_usavel() -> void:
	$Sprite2D.show();
	$HitBox/AnimatedSprite2D.show();
	Input.set_custom_mouse_cursor(null);


func setar_colocavel() -> void:
	$HitBox/AnimatedSprite2D.hide();
	$Sprite2D.hide();
	Input.set_custom_mouse_cursor(load("res://resource/texturas/personagem/ui/Flecha_UI.png"))


func esvaziar() -> void:
	Equipado = null;
	Dano = 0;
	DanoMaximo = 0;
	VelocidadeDeAtaque = 0;
	VelocidadeDeAtaqueMaxima = 0;
	Durabilidade = -1;
	DurabilidadeMaxima = -1;
	Quantidade = -1;
	$Sprite2D.texture = null;


func flip_espada(direcao: int) -> void:
	if (direcao == 8):
		$Sprite2D.position = Vector2(0, 32);
		$Sprite2D.rotation_degrees = 90;
	elif (direcao == 2):
		$Sprite2D.position = Vector2(0, -32);
		$Sprite2D.rotation_degrees = 90;
	elif (direcao == 4):
		$Sprite2D.position = Vector2(32, 0);
		$Sprite2D.rotation_degrees = 0;
	elif (direcao == 6):
		$Sprite2D.position = Vector2(-32, 0);
		$Sprite2D.rotation_degrees = 0;


func _physics_process(delta) -> void:
	if ((Equipado is ItemArma or Equipado is ItemFerramenta) and Atacando == false):
		$HitBox.look_at(get_global_mouse_position());
		if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
			Atacando = true;
			$Sprite2D.hide();
			$HitBox/AnimatedSprite2D.play("Ferramenta");
	elif (Equipado is ItemBloco or Equipado is ItemArremessavel):
		$Sprite2D.position = get_global_mouse_position();

#Funções
func _on_animated_sprite_2d_animation_looped():
	Atacando = false;
	$Sprite2D.show();
	$HitBox/AnimatedSprite2D.play("default");
	$HitBox/AnimatedSprite2D.stop();



func _on_hit_box_body_entered(body):
	print(body);
