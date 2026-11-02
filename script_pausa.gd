extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(Input.is_action_just_pressed("pausa")):
		get_tree().paused  = not get_tree().paused
		visible = get_tree().paused
		
