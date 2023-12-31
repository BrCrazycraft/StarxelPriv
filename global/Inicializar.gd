class_name InicializarProjeto;

const BASE : String = "user://"; #BASE
const SAVE : String = "user://Save/"; #Pasta de Saves
const CONFIGURACAO: String = "user://config/"; #Configurações

static func iniciar() -> void:
	var base = DirAccess.open(BASE);
	var save = DirAccess.open(SAVE);
	var config = DirAccess.open(CONFIGURACAO);


	if ((save == null or config == null)):
		base.make_dir("Save");
		base.make_dir("Config");
