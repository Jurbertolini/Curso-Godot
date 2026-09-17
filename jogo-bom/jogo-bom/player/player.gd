extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0



func _physics_process(delta: float) -> void:

	var direction := Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()
		
	if direction:
		velocity = direction * SPEED
		
		
		if velocity.x <0:
			animated_sprite_2d.flip_h = true
			animated_sprite_2d.play("walk")
		if velocity.x >0:
			animated_sprite_2d.flip_h = false
			animated_sprite_2d.play("walk")
		if velocity.y <0:
			animated_sprite_2d.play("walk_up")
		if velocity.y >0:
			animated_sprite_2d.play("walk_down")
	
	else:
		velocity = Vector2.ZERO
		animated_sprite_2d.play("idle")
		
		

	move_and_slide()
