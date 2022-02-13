extends Node

const TILE_PRIMARY = 0
const TILE_SECONDARY = 1
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
    var character_cells: Array

    for character in GroupController.get("Characters").all():
        character_cells.append(tile_map_action.world_to_map(character.position))

    for cell in tile_map_floor.get_used_cells():
        astar_movement.add_point(get_vector_point_index(cell), cell)

    for point in astar_movement.get_points():
        var cell: Vector2 = astar_movement.get_point_position(point)

        var relative_cells: Array = [
            cell + Vector2.UP,
            cell + Vector2.DOWN,
            cell + Vector2.LEFT,
            cell + Vector2.RIGHT,
        ]

        for relative_cell in relative_cells:
            var relative_cell_point: int = get_vector_point_index(relative_cell)

            if !astar_movement.has_point(relative_cell_point):
                continue

            if character_cells.has(relative_cell):
                continue

            astar_movement.connect_points(point, relative_cell_point, false)


func get_vector_point_index(cell: Vector2) -> int:
    var vector_point_index: int = int("%s%s" % [cell.y, cell.x])

    if vector_point_index < 0:
        vector_point_index += NEGATIVE_VECTOR_POINT_INDEX_BUFFER

    return vector_point_index
