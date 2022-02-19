class_name AttackEffect
extends RelativePointsAction

export var damage: int


func refresh_cells() -> void:
    cells.clear()

    for relative_point in _relative_points:
        cells.append(active_cell + relative_point)


func draw_cells() -> void:
    AttackController.tile_map.clear()
    AttackController.tile_map.modulate = _tile_map_action_modulate

    for cell in cells:
        AttackController.tile_map.set_cellv(cell, ActionController.TILE_PRIMARY)


func do() -> void:
    for character in GroupController.get("Characters").all():
        var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(character.position)
        
        if !cells.has(character_cell):
            continue
        
        var character_health_points: Stat = character.get_node("Stats/HealthPoints")
        character_health_points.value -= damage
