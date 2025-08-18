extends CharacterBody3D

@onready var forward_ray: RayCast3D = $Navigation/ForwardRay
@onready var down_ray: RayCast3D = $Navigation/DownRay
@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")



var dir : Vector3
var isJumped = false # default bool to check character jump state

func _physics_process(delta: float) -> void:
	# apply gravity if the player is not on the floor
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0  # reset vertical velocity when on the floor
		isJumped = false
		

	if dir == Vector3.ZERO:
		velocity.x = dir.x + 1 * Ga.speed * delta
		#velocity.z = dir.z * Ga.speed * delta # not needed for now
	
	overpass_logic()
	move_and_slide()
	
func overpass_logic(): # overpass every obstacle in game
	if forward_ray.is_colliding() and not isJumped:
		print("Forward Obstacle")
		jump()
		isJumped = true
		
func jump(): # simple push to velocity value
	print("Jump up")
	velocity.y += Ga.jump_up_force
