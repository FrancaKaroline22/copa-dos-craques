extends CharacterBody2D 

var direcao    = 1
var gravidade  = 20
var velocidade = 300
var esta_na_tela = false

func _process(delta: float) -> void:
	velocity.y += gravidade
	velocity.x  = 0
	if (esta_na_tela and is_on_floor() and not $Timer.is_stopped()):
		$AnimationPlayer.play("andando")
		velocity.x = velocidade * direcao

	var posx = $VisibleOnScreenNotifier2D.position.x
	if (direcao<0):
		$Sprite2D.flip_h = true
		$VisibleOnScreenNotifier2D.position.x = abs(posx) * -1
	else:
		$Sprite2D.flip_h = false
		$VisibleOnScreenNotifier2D.position.x = abs(posx)
	
	move_and_slide()

func parado() -> void:
	$Timer.stop()
	$AnimationPlayer.play("parado")

func atacar() -> void:
	$AnimationPlayer.play("atacando")
	
func voltar_andar():
	$Timer.start()
	$AnimationPlayer.play("andando")

func mudar_direcao() -> void:
	esta_na_tela = false
	direcao *= -1
	
func perseguir() -> void:
	esta_na_tela = true
	
func causar_dano_personagem():
	var personagem = ScriptGlobal.personagem
	
	if (personagem.is_on_floor() and esta_na_tela):
		ScriptGlobal.qtd_vidas -= ScriptGlobal.valor_dano
