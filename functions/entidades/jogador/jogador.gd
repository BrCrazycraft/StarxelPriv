extends CharacterBody2D;

#Signal
signal coletou(Itm: ItemDropado);

#Propriedades
@export var Velocidade: int;
@export var VelocidadeMaxima: int;
#Propriedades <Variaveis>
@onready var ANIMATION = $Animated;
var Direcao: int = 0;

#Recursos
func _physics_process(delta) -> void: #Logica de Animação
	var Direction: Vector2 = Vector2.ZERO;
	
	if (Input.is_action_pressed("key_up")):
		if (Input.is_action_pressed("key_run")):
			Direction.y = -2 * Velocidade;
			if (Direcao != 6 and Direcao != 4):
				ANIMATION.play("costa_correndo");

		else:
			Direction.y = -Velocidade;
			if (Direcao != 6 and Direcao != 4):
				ANIMATION.play("costa_andando");
		Direcao = 8;
	elif (Input.is_action_pressed("key_down")):
		if (Input.is_action_pressed("key_run")):
			Direction.y = 2 * Velocidade;
			if (Direcao != 6 and Direcao != 4):
				ANIMATION.play("frente_correndo");
		else:
			Direction.y = Velocidade;
			if (Direcao != 6 and Direcao != 4):
				ANIMATION.play("frente_andando");
		Direcao = 2;
	
	
	if (Input.is_action_pressed("key_left")):
		if (Input.is_action_pressed("key_run")):
			Direction.x = -2 * Velocidade;
			ANIMATION.play("lado_correndo");
		else:
			Direction.x = -Velocidade;
			ANIMATION.play("lado_andando");
		ANIMATION.flip_h = false;
		Direcao = 4;
	elif (Input.is_action_pressed("key_right")):
		if (Input.is_action_pressed("key_run")):
			Direction.x = 2 * Velocidade;
			ANIMATION.play("lado_correndo");
		else:
			Direction.x = Velocidade;
			ANIMATION.play("lado_andando");
		Direcao = 6;
		ANIMATION.flip_h = true;
	
	if (Direction == Vector2.ZERO):
		if (Direcao == 8):
			ANIMATION.play("costa_parado");
		elif (Direcao == 2):
			ANIMATION.play("frente_parado");
		elif (Direcao == 4 or Direcao == 6):
			ANIMATION.play("lado_parado");
	move_and_collide(Direction);
	$Mao.flip_espada(Direcao);




func equipar(Itm: Item) -> void:
	$Mao.equipar_item(Itm);


#Funçôes


func _on_entidade_morreu():
	pass # Replace with function body.


func _on_entidade_se_curou(cura: int):
	pass # Replace with function body.


func _on_entidade_tomou_dano(dano: int, tipo: String):
	pass # Replace with function body.


func alterar_mao(Novo: Item, Antigo: Item) -> void:
	$Mao.equipar_item(Novo);
