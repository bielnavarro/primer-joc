extends Node2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500 

func _physics_process(delta):
	
	velocitat.x = 0
	
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT* velocitat_base
	if Input.is_action_just_pressed("mou amunt"):
		velocitat += salt
	if Input.is_action_just_pressed("mou avall"):
		velocitat += Vector2.DOWN * velocitat_base
	velocitat += gravetat * delta

func anima(velocitat: Vector2):
		var animacio : AnimatedSprite = $AnimatedSprite
		if velocitat.x > 0:
			animacio.flip_h = false
			animacio.play('camina')
		elif velocitat.x < 0 :
			animacio.flip_h = true 
			animacio.play('camina')
		
		if velocitat.y < -1:
			animacio.play('salta')
			return 
		
		if abs(velocitat.x) < 0.5:
			animacio.play('quiet')
