extends CharacterBody2D

#Sinais
signal Atualizar(Energia: int, Vida: int);

#Propriedades
@export var BASE: Status = Status.new();
@export var ENERGIA: int;
@export var ENERGIA_MAXIMA: int;

#Variaveis
var eixo: int = 0;
var atacando: bool = false;

#Recursos - Base
func carregar_personagem() -> void:
	BASE.carregar(ControladorSave.Player_Var);
	ENERGIA = ControladorSave.Player_Var["ENERGIA"];
	ENERGIA_MAXIMA = ControladorSave.Player_Var["ENERGIA"];

func atualizar_save() -> void:
	var Player_Var: Dictionary = {};
	Player_Var.merge(BASE.diocionario());
	Player_Var["ENERGIA"] = ENERGIA_MAXIMA;
	ControladorSave.Player_Var = Player_Var;


#Recursos
func Tempo_Ataque() -> void:
	atacando = true;
	$Skin/Arma.hide();
	$Weapon/Ferramenta/Efeito.show();
	$Weapon/Ferramenta/Efeito.play("Espada");
	$Weapon/Ferramenta.monitoring = true;
	await get_tree().create_timer(1.0 / BASE.VELOCIDADE).timeout;
	$Weapon/Ferramenta/Efeito.hide();
	$Weapon/Ferramenta/Efeito.stop();
	$Skin/Arma.show();
	$Weapon/Ferramenta.monitoring = false;
	atacando = false;
	

#Funções
func _ready() -> void:
	carregar_personagem();
	BASE.VELOCIDADE = 2;


func _physics_process(delta) -> void:
	var direcao : Vector2 = Vector2.ZERO;
	
	if (Input.is_action_pressed("ui_up")):
		if (Input.is_action_pressed("ui_run") and ENERGIA > 0):
			direcao.y = -BASE.VELOCIDADE * 1.5;
		else:
			direcao.y = -BASE.VELOCIDADE;
		eixo = 8;

	elif (Input.is_action_pressed("ui_down")):
		if (Input.is_action_pressed("ui_run") and ENERGIA > 0):
			direcao.y = BASE.VELOCIDADE * 1.5;
		else:
			direcao.y = BASE.VELOCIDADE;
		eixo = 2;



	if (Input.is_action_pressed("ui_left")):
		if (Input.is_action_pressed("ui_run") and ENERGIA > 0):
			direcao.x = -BASE.VELOCIDADE * 1.5;
		else:
			direcao.x = -BASE.VELOCIDADE;
		eixo = 4;

	elif (Input.is_action_pressed("ui_right")):
		if (Input.is_action_pressed("ui_run") and ENERGIA > 0):
			direcao.x = BASE.VELOCIDADE * 1.5;
		else:
			direcao.x = BASE.VELOCIDADE;
		eixo = 6;

	move_and_collide(direcao);



	if (Input.is_action_pressed("ui_up") and (Input.is_action_pressed("ui_left") == false and Input.is_action_pressed("ui_right") == false)):
		if (Input.is_action_pressed("ui_run") and ENERGIA > 0):
			$Skin/Personagem.play("correndo_costa");
			$Skin/Personagem.flip_h = false;
		else:
			$Skin/Personagem.play("andando_costa");
			$Skin/Personagem.flip_h = false;
		$Skin/Arma.position = Vector2(0 , 12);
		$Skin/Arma.rotation_degrees = 90;

	elif (Input.is_action_pressed("ui_down") and (Input.is_action_pressed("ui_left") == false and Input.is_action_pressed("ui_right") == false)):
		if (Input.is_action_pressed("ui_run") and ENERGIA > 0):
			$Skin/Personagem.play("correndo_frente");
			$Skin/Personagem.flip_h = false;
		else:
			$Skin/Personagem.play("andando_frente");
			$Skin/Personagem.flip_h = false;
		$Skin/Arma.position = Vector2(0 , -12);
		$Skin/Arma.rotation_degrees = 90;

	else:
		if (eixo == 2):
			$Skin/Personagem.play("parado_frente");
			$Skin/Personagem.flip_h = false;
			$Skin/Personagem.stop();
		elif (eixo == 8):
			$Skin/Personagem.play("parado_costa");
			$Skin/Personagem.flip_h = false;
			$Skin/Personagem.stop();



	if (Input.is_action_pressed("ui_left")):
		if (Input.is_action_pressed("ui_run") and ENERGIA > 0):
			$Skin/Personagem.play("correndo_lado");
			$Skin/Personagem.flip_h = false;
		else:
			$Skin/Personagem.play("andando_lado");
			$Skin/Personagem.flip_h = false;
		$Skin/Arma.position = Vector2(12 , 0);
		$Skin/Arma.rotation_degrees = 0;

	elif (Input.is_action_pressed("ui_right")):
		if (Input.is_action_pressed("ui_run") and ENERGIA > 0):
			$Skin/Personagem.play("correndo_lado");
			$Skin/Personagem.flip_h = true;
		else:
			$Skin/Personagem.play("andando_lado");
			$Skin/Personagem.flip_h = true;
		$Skin/Arma.position = Vector2(-12 , 0);
		$Skin/Arma.rotation_degrees = 0;
	else:
		if (eixo == 6):
			$Skin/Personagem.play("parado_lado");
			$Skin/Personagem.flip_h = true;
			$Skin/Personagem.stop();
		elif (eixo == 4):
			$Skin/Personagem.play("parado_lado");
			$Skin/Personagem.flip_h = false;
			$Skin/Personagem.stop();

	if (atacando == false):
		$Weapon.look_at(get_global_mouse_position());


func _process(delta) -> void:
	if (Input.is_action_just_pressed("ui_click_left") and atacando == false):
		Tempo_Ataque();
	
