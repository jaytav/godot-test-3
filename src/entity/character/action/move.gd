extends Action


func draw_action() -> void:
    .draw_action()
    
    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)
    var character_point: int = ActionController.get_vector_point_index(character_cell)
    var character_action_points: Stat = owner.get_node("Stats/ActionPoints")

    for point in ActionController.astar_movement.get_points():
        var point_path_cells: Array = ActionController.astar_movement.get_point_path(character_point, point)
        
        # remove character cell
        point_path_cells.remove(0)
        
        if len(point_path_cells) > character_action_points.value:
            continue

        for point_path_cell in point_path_cells:
            ActionController.tile_map_action.set_cellv(point_path_cell, 0)


func _on_Player_turn_started(character: Character) -> void:
    draw_action()
