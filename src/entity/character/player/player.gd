extends Character

onready var active_action: Action = get_node("Actions/Move")


func _on_Player_turn_started(character: Character) -> void:
    active_action.refresh_cells()
    active_action.draw_cells()
