extends CharacterBody2D


const SPEED = 100.0

var player_state


const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var direction = Input.get_vector("left", "right","up", "down")
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		
		
	velocity = direction * SPEED
	play_anim(direction)
	move_and_slide()
	
func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	elif player_state == "walking":
		play_walking_animation(dir)

func play_walking_animation(dir):
	if dir.y == -1:
		$AnimatedSprite2D.play("n-walk")
	if dir.x == 1:
		$AnimatedSprite2D.play("e-walk")
	if dir.y == 1:
		$AnimatedSprite2D.play("s-walk")
	if dir.x == -1:
		$AnimatedSprite2D.play("w-walk")
		
	if dir.x > 0.5 and dir.y < -0.5:
		$AnimatedSprite2D.play("ne-walk")
	if dir.x > 0.5 and dir.y < -0.5:
		$AnimatedSprite2D.play("se-walk")
	if dir.x > 0.5 and dir.y < -0.5:
		$AnimatedSprite2D.play("sw-walk")
	if dir.x > 0.5 and dir.y < -0.5:
		$AnimatedSprite2D.play("nw-walk")
