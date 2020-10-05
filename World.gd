extends Node2D

const Player = preload("res://Player.tscn")
const Exit = preload("res://Exit.tscn")
const Enemy = preload("res://Ghost.tscn")

var borders = Rect2(1, 1, 32, 21)
var score:int = 0

onready var tileMap = $TileMap

func _ready():
	$AudioStreamPlayer2D.playing = true
	randomize()
	generatelevel()

func generatelevel():
	var walker = Walker.new(Vector2(19, 11), borders)
	var map = walker.walk(500)
	
	var player = Player.instance()
	add_child(player)
	player.position = map.front() * 32
	
	var exit = Exit.instance()
	add_child(exit)
	exit.position = walker.get_end_room().position * 32
	exit.connect("leaving_level", self, "reload_level")
	
	var enemy = Enemy.instance()
	add_child(enemy)
	enemy.position = player.position - exit.position
	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
	
	tileMap.update_bitmask_region(borders.position, borders.end)
	
	
func _process(delta):
	$Label.text = str(score)
	
	
func reload_level():
	get_tree().reload_current_scene()
	
		
