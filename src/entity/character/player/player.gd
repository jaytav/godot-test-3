extends Character

export var _initial_active_action: NodePath = "Actions/Move"

onready var active_action: Action = get_node(_initial_active_action)


func start_turn() -> void:
    .start_turn()

    active_action.refresh_cells()
    active_action.draw_cells()


func end_turn() -> void:
    .end_turn()
    
    ActionController.tile_map_action.clear()
