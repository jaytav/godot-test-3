extends RelativePointsAction

export var _action_point_cost: int

onready var _attack_effect: AttackEffect = get_node("AttackEffect")


func draw_behaviour(cell: Vector2) -> void:
    if !cells.has(cell):
        active_cell = Vector2.ZERO
        _attack_effect.active_cell = Vector2.ZERO
        AttackController.tile_map.clear()
        return

    if cell == active_cell:
        return

    active_cell = Vector2.ZERO
    _attack_effect.active_cell = cell
    _attack_effect.refresh_cells()
    _attack_effect.draw_cells()


func do() -> void:
    if _attack_effect.active_cell == Vector2.ZERO:
        return

    var character_action_points: Stat = owner.get_node("Stats/ActionPoints")
    character_action_points.value -= _action_point_cost
    _attack_effect.do()
