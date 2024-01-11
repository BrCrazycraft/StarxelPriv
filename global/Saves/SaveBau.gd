class_name SaveBau;

static var Bau_Var: Dictionary = {};


static func salvar_bau() -> void:
	var file: FileAccess = FileAccess.open(ControladorSave.PathMundo + "BAUS.dat", FileAccess.WRITE);

	if (file.is_open() == true):
		file.store_var(Bau_Var);
		file.close();


static func carregar_bau(Ticket: String) -> Dictionary:
	var file: FileAccess = FileAccess.open(ControladorSave.PathMundo + "BAUS.dat", FileAccess.READ_WRITE);
	
	if (file != null):
		var dir: Dictionary = file.get_var();
		if (dir.has(Ticket)):
			return dir[Ticket];
	else:
		print_debug("SaveBau[carregar_bau(", Ticket, ")]: var file = Vazio")
	return {};
