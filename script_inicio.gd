extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func iniciar_jogo() -> void:
	get_tree().change_scene_to_file("res://cena_fase.tscn")
	
func sair() -> void:
	get_tree().quit()

func ir_para_configuracoes() -> void:
	get_tree().change_scene_to_file("res://cena_configuracoes.tscn")
