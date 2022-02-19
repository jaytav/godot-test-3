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
    elif event.is_action_pressed("ui_focus_next"):
        var active_action: Action = owner.active_action
        var actions: Array = owner.get_node("Actions").get_children()

        for i in range(actions.size()):
            if actions[i] == active_action:
                if actions[i] == actions.back():
                    owner.active_action = actions.front()
                else:
                    owner.active_action = actions[i + 1]
                break

        AttackController.tile_map.clear()
        owner.active_action.active_cell = Vector2.ZERO
        owner.active_action.refresh_cells()
        owner.active_action.draw_cells()

        var mouse_position: Vector2 = owner.get_global_mouse_position()
        var action_cell: Vector2 = ActionController.tile_map_action.world_to_map(mouse_position)

        owner.active_action.draw_behaviour(action_cell)
