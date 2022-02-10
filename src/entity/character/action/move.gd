extends Action


func refresh_cells() -> void:
    .refresh_cells()

    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)
    var character_point: int = ActionController.get_vector_point_index(character_cell)
    var character_action_points: Stat = owner.get_node("Stats/ActionPoints")

    for point in ActionController.astar_movement.get_points():
        var point_path_cells: Array = ActionController.astar_movement.get_point_path(character_point, point)
        point_path_cells.erase(character_cell)

        if len(point_path_cells) > character_action_points.value:
            continue

        for point_path_cell in point_path_cells:
            if !cells.has(point_path_cell):
                cells.append(point_path_cell)


func draw_behaviour() -> void:
    var mouse_position: Vector2 = owner.get_global_mouse_position()
    var action_cell: Vector2 = ActionController.tile_map_action.world_to_map(mouse_position)

    if !cells.has(action_cell):
        return

    if action_cell == current_cell:
        return

    draw_cells()

    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)
    var character_point: int = ActionController.get_vector_point_index(character_cell)
    var action_point: int = ActionController.get_vector_point_index(action_cell)
    var point_path_cells: Array = ActionController.astar_movement.get_point_path(character_point, action_point)
    point_path_cells.erase(character_cell)

    for point_path_cell in point_path_cells:
        ActionController.tile_map_action.set_cellv(point_path_cell, ActionController.TILE_SECONDARY)
