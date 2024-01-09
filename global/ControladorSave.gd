class_name ControladorSave;

#Variaveis
const CAMINHO : String = "user://";
const PASTA : String = "Save";
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
	var files = DirAccess.open(CAMINHO + "/" + PASTA);
	return files.get_directories();


static func criar_saves(Nome: String) -> bool:
	if (DirAccess.dir_exists_absolute(CAMINHO + "/" + PASTA + "/" + Nome) == true) : return false;
	
	Save = Nome;
	
	var mundo = DirAccess.open(CAMINHO);
	mundo.make_dir(PASTA);
	mundo.make_dir(PASTA + "/" + Nome);
	mundo.make_dir(PASTA + "/" + Nome + "/Mundo");
	mundo.make_dir(PASTA + "/" + Nome + "/Personagem");
	
	var mapas = CAMINHO + "/" + PASTA + "/" + Nome + "/Mundo";
	var player = CAMINHO + "/" + PASTA + "/" + Nome + "/Personagem";

	return true;


static func Carregar_Teste() -> void:
	SaveBau.CAMINHO = CAMINHO + "/" + PASTA + "/" + "Teste" + "/Mundo/";
