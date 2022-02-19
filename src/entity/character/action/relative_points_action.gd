class_name RelativePointsAction
extends Action

export var _relative_points: PoolVector2Array


func refresh_cells() -> void:
    .refresh_cells()

    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)
    
    for relative_point in _relative_points:
        cells.append(character_cell + relative_point)
