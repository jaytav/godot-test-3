extends Character

onready var active_action: Action = get_node("Actions/Move")


func start_turn() -> void:
    .start_turn()

    active_action.refresh_cells()
    active_action.draw_cells()
