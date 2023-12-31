extends Sprite2D


func Construtor(Textura: CompressedTexture2D) -> void:
	texture = Textura;

func _physics_process(delta) -> void:
	position = get_global_mouse_position();
