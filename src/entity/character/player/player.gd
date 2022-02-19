extends Character

export var _initial_active_action: NodePath = "Actions/Move"

onready var active_action: Action = get_node(_initial_active_action)


func start_turn() -> void:
    .start_turn()

    active_action.refresh_cells()
    active_action.draw_cells()

    var mouse_position: Vector2 = get_global_mouse_position()
    var action_cell: Vector2 = ActionController.tile_map_action.world_to_map(mouse_position)

    active_action.draw_behaviour(action_cell)


func end_turn() -> void:
    ActionController.tile_map_action.clear()
    active_action.active_cell = Vector2.ZERO

    .end_turn()
