extends CharacterBody2D

@export var Velocidade: int;
@export var VelocidadeMaxima: int;




#Recursos
func _physics_process(delta) -> void:
	pass


#Funçôes
func _on_entidade_morreu():
	pass # Replace with function body.


func _on_entidade_se_curou(cura: int):
	pass # Replace with function body.


func _on_entidade_tomou_dano(dano: int, tipo: String):
	pass # Replace with function body.
