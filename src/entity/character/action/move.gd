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


func draw_behaviour(cell: Vector2) -> void:
    if !cells.has(cell):
        active_cell = Vector2.ZERO
        draw_cells()
        return

    if cell == active_cell:
        return

    active_cell = cell
    draw_cells()

    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)
    var character_point: int = ActionController.get_vector_point_index(character_cell)
    var point: int = ActionController.get_vector_point_index(cell)
    var point_path_cells: Array = ActionController.astar_movement.get_point_path(character_point, point)
    point_path_cells.erase(character_cell)

    for point_path_cell in point_path_cells:
        ActionController.tile_map_action.set_cellv(point_path_cell, ActionController.TILE_SECONDARY)


func do() -> void:
    if active_cell == Vector2.ZERO:
        return

    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)
    var character_point: int = ActionController.get_vector_point_index(character_cell)
    var active_point: int = ActionController.get_vector_point_index(active_cell)
    var point_path_cells: Array = ActionController.astar_movement.get_point_path(character_point, active_point)
    point_path_cells.erase(character_cell)

    var character_action_points: Stat = owner.get_node("Stats/ActionPoints")
    character_action_points.value -= len(point_path_cells)

    var move_to_position: Vector2 = ActionController.tile_map_action.map_to_world(active_cell)
    move_to_position.y += ActionController.tile_map_action.cell_size.y / 2
    owner.position = move_to_position

    ActionController.refresh_astar_movement()
    refresh_cells()
    draw_cells()
