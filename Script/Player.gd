extends KinematicBody2D

var Velocidad = 100
var movimiento = Vector2(0,0)
var Gravedad = 20
var Jump = -600

func _process(delta):
	motion_ctr() 

func _physics_process(delta):
	
	if Input.is_action_pressed("Derecha"):
		$CollisionShape2D.position.x = -12.857
		movimiento.x += Velocidad
		$AnimatedSprite.play("Caminando")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("Izquierda"):
		$CollisionShape2D.position.x = 12.857
		movimiento.x -= Velocidad
		$AnimatedSprite.play("Caminando")
		$AnimatedSprite.flip_h = true
		
		
	else:
		$AnimatedSprite.play("Quieto")
	if not is_on_floor():
		$AnimatedSprite.play("Salto")
	if Input.is_action_just_pressed("Arriba") and is_on_floor():
		movimiento.y = Jump
		
func motion_ctr():
	if Input.is_action_just_pressed(""):
		$AnimatedSprite.play("")
		pass
		
	movimiento.y += Gravedad
	
	movimiento = move_and_slide(movimiento, Vector2.UP)
	
	movimiento.x = lerp(movimiento.x, 0, 0.2)
