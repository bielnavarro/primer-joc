extends Area2D


var velocitat := 300
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


func _on_Personatge_area_entered(area):
	modulate = Color(1,0,0)


func _on_Personatge_area_exited(area):
	modulate = Color(1,1,1)
