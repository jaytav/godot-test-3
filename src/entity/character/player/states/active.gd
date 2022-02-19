extends State


func unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        var mouse_position: Vector2 = owner.get_global_mouse_position()
        var action_cell: Vector2 = ActionController.tile_map_action.world_to_map(mouse_position)

        owner.active_action.draw_behaviour(action_cell)
    elif event.is_action_pressed("left_click"):
       owner.active_action.do()
    elif event.is_action_pressed("ui_select"):
        owner.end_turn()
    
