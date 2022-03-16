extends Area2D


var velocitat := 1000
var direccio = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = 0
	position = Vector2(500,300)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("mou dreta"):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("mou esquerra"):
		direccio += Vector2.LEFT
	if Input.is_action_pressed("mou amunt"):
		direccio += Vector2.UP
	if Input.is_action_pressed("mou avall"):
		direccio += Vector2.DOWN
		
	position += direccio.normalized() * velocitat * delta
	
	direccio = Vector2(0,0)


func _on_Personatge_area_entered(area: Area2D):
	if area.is_in_group('inici'):
		modulate = Color(1,0,0)
	elif area.is_in_group('final'):
		modulate = Color(1,0,1)
 

func _on_Personatge_area_exited(area):
	modulate = Color(1,1,1)

