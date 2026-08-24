extends CharacterBody2D

@export_range(0.0, 10000.0, 1.0) var speed: float = 300.0

@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
  velocity.x = Input.get_axis("move_left", "move_right") * speed
  velocity.y += gravity * delta
  if Input.is_action_just_pressed("jump") and is_on_floor():
    velocity.y = -400.0
  move_and_slide()
