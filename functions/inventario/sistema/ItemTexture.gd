extends TextureRect

var MODE: bool;

#Propriedades
func criar(Mode: bool, Valor: int, Max: int ,Textura: CompressedTexture2D):
	texture = Textura;
	MODE = Mode;
	$Label.show();
	$ProgressBar.show();
	if (Mode == true):
		$Label.hide();
		$ProgressBar.value = Valor;
		$ProgressBar.max_value = Valor;
	else:
		$ProgressBar.hide();
		$Label.text = "x" + str(Valor);


func atualizar(Valor: int):
	if (MODE == true):
		$ProgressBar.value = Valor;
	else:
		$Label.value = Valor;


func limpar():
	texture = null;
	$Label.hide();
	$ProgressBar.hide();
