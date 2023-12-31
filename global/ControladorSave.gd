class_name ControladorSave;

#Variaveis
const CAMINHO : String = "user://";
const PASTA : String = "Save";
static var Save: String = "NULL";

#Caracteristicas de Jogo
static var Player_Var: Dictionary = {
	"VIDA_ATUAL" = 100,
	"VIDA_MAXIMA" = 100,
	"ENERGIA_ATUAL" = 200,
	"ENERGIA_MAXIMA" = 200,
	"DEFESA_ATUAL" = 0,
	"DEFESA_MAXIMA" = 0,
	"PROTECAO_ATUAL" = 0,
	"PROTECAO_MAXIMA" = 0,
	"VELOCIDADE_ATUAL" = 2.0,
	"VELOCIDADE_MAXIMA" = 2.0,
	"VELOCIDADE_ACAO_ATUAL" = 1.0,
	"VELOCIDADE_ACAO_MAXIMA" = 1.0,
};

#Recursos





#Funções

static func pegar_saves() -> Array:
	var files = DirAccess.open(CAMINHO + "/" + PASTA);
	return files.get_directories();


static func criar_saves(Nome: String) -> bool:
	if (DirAccess.dir_exists_absolute(CAMINHO + "/" + PASTA + "/" + Nome) == true) : return false;
	
	var mundo = DirAccess.open(CAMINHO);
	mundo.make_dir(PASTA);
	mundo.make_dir(PASTA + "/" + Nome);
	mundo.make_dir(PASTA + "/" + Nome + "/Mundo");
	mundo.make_dir(PASTA + "/" + Nome + "/Personagem");
	
	var mapas = CAMINHO + "/" + PASTA + "/" + Nome + "/Mundo";
	var player = CAMINHO + "/" + PASTA + "/" + Nome + "/Personagem";

	return true;
