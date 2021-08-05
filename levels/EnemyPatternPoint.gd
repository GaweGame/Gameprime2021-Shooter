extends Position2D

export(PackedScene) var pattern
#export(NodePath) var loadTo
onready var arena = $"../Arena"

func _on_Area2D_area_entered(area):
	if not pattern and not arena:
		pass
	
	if area.name == "HeroBulletArea":
		var loaded_pattern = pattern.instance()
#		var loadTo_node = get_node(loadTo)
#		loadTo_node.loadEnemyPattern(loaded_pattern)
		arena.loadEnemyPattern(loaded_pattern)
