extends KinematicBody2D

var velocidad = 20
var movimiento = Vector2(0,0)
var forgod = true 
var gravedad = 20 

func _physics_process(delta) -> void:
	
	if $Dect_izq.is_colliding():
		$Sprite.flip_h = true 
		$CollisionShape2D.position.x = 13
		$AnimationPlayer.play("atacarizq")
		movimiento.x == 0
		
	elif $Dect_der.is_colliding():
		$Sprite.flip_h = false
		$CollisionShape2D.position.x = -13
		$AnimationPlayer.play("atacar")
		movimiento.x == 0
	
		
	if is_on_wall():
		forgod = not forgod 
		
		
	if forgod == true: 
		$CollisionShape2D.position.x = 13
		movimiento.x = 50 
		$AnimationPlayer.play("Caminar")
		$Sprite.flip_h = false 

	

	else: 
		movimiento.x = -50 
		$CollisionShape2D.position.x = -13
		$AnimationPlayer.play("Caminar")
		$Sprite.flip_h = true


	movimiento.y += gravedad 

	movimiento = move_and_slide(movimiento, Vector2.UP)
	
	movimiento.x = lerp(movimiento.x, 0, 0.2)
