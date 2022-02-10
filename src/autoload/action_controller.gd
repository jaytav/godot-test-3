extends Node

const NEGATIVE_VECTOR_POINT_INDEX_BUFFER = 999999

var tile_map_action: TileMap
var tile_map_floor: TileMap
var astar_movement: AStar2D = AStar2D.new()


func init() -> void:
    tile_map_action = GroupController.get("TileMaps").get("Action")
    tile_map_floor = GroupController.get("TileMaps").get("Floor")
    refresh_astar_movement()


func refresh_astar_movement() -> void:
    astar_movement.clear()

    for cell in tile_map_floor.get_used_cells():
        astar_movement.add_point(get_vector_point_index(cell), cell)

    for point in astar_movement.get_points():
        var cell: Vector2 = astar_movement.get_point_position(point)
        
#        do Vector2.RIGHT/DOWN HERE
        var relative_cells: Array = [
            Vector2(cell.x + 1, cell.y),
            Vector2(cell.x, cell.y - 1),
        ]

        for relative_cell in relative_cells:
            var relative_cell_point: int = get_vector_point_index(relative_cell)

            if !astar_movement.has_point(relative_cell_point):
                continue

            astar_movement.connect_points(point, relative_cell_point)


func get_vector_point_index(cell: Vector2) -> int:
    var vector_point_index: int = int("%s%s" % [cell.y, cell.x])

    if vector_point_index < 0:
        vector_point_index += NEGATIVE_VECTOR_POINT_INDEX_BUFFER

    return vector_point_index