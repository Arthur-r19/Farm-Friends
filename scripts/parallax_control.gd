extends Control

@onready var clouds1: TextureRect = $TextureRect2
@onready var clouds2: TextureRect = $TextureRect3
@onready var mountains1: TextureRect = $TextureRect5
@onready var mountains2: TextureRect = $TextureRect4
@onready var character_body_2d: CharacterBody2D = %CharacterBody2D

var mountains1_init_pos 
var mountains2_init_pos 

func _ready() -> void:
	mountains1_init_pos = mountains1.position
	mountains2_init_pos = mountains2.position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	clouds1.position.x -= 1
	clouds1.position.x = int(clouds1.position.x) % int(clouds1.size.x)
	clouds2.position.x -= 1
	clouds2.position.x = int(clouds2.position.x) % int(clouds2.size.x)
	mountains1.position.x = - character_body_2d.position.x / 60
	mountains2.position.x = - character_body_2d.position.x / 30
