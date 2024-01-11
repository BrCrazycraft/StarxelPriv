class_name ControladorSave;

#Variaveis
const CAMINHO : String = "user://Save/";
static var PathMundo : String;
static var PathPlayer : String;
static var Save: String = "NULL";

#Caracteristicas de Jogo
static var Player_Var: Dictionary = {
	"PLAYER_DANO" : 10,
	"PLAYER_CRITICO" : 1.0,
	"PLAYER_TAXA" : 0,
	"PLAYER_TIPO_DANO" : "NORMAL",
	"PLAYER_VIDA" : 100,
	"PLAYER_DEFESA" : 20,
	"PLAYER_PROTECAO" : 20,
	"ENERGIA" : 100,
};

#Funções
static func pegar_saves() -> Array:
	var files = DirAccess.open(CAMINHO);
	return files.get_directories();


static func criar_saves(Nome: String) -> bool:
	if (DirAccess.dir_exists_absolute(CAMINHO + Nome) == true) : return false;
	
	Save = Nome;
	
	var mundo = DirAccess.open("user://");
	mundo.make_dir("Save/");
	mundo.make_dir(CAMINHO + Nome);
	Save = CAMINHO + Nome + "/";
	mundo.make_dir(CAMINHO + Nome + "/Mundo");
	mundo.make_dir(CAMINHO + Nome + "/Personagem");
	
	var mapas = CAMINHO + Nome + "/Mundo";
	var player = CAMINHO + Nome + "/Personagem";

	return true;


static func Carregar_Teste() -> void:
	PathMundo = CAMINHO + "Teste" + "/Mundo/";
	PathPlayer = CAMINHO + "Teste" + "/Mundo/";
