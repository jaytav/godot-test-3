extends RelativePointsAction

export var _action_point_cost: int

onready var _attack_effect: AttackEffect = get_node("AttackEffect")
onready var _action_points: Stat = owner.get_node("Stats/ActionPoints")

func refresh_cells() -> void:
    if _action_points.value < _action_point_cost:
        cells.clear()
        return
    
    .refresh_cells()


func draw_behaviour(cell: Vector2) -> void:
    if !cells.has(cell):
        active_cell = Vector2.ZERO
        _attack_effect.active_cell = Vector2.ZERO
        AttackController.tile_map.clear()
        return

    if cell == active_cell:
        return

    active_cell = cell
    _attack_effect.active_cell = cell
    _attack_effect.refresh_cells()
    _attack_effect.draw_cells()


func do() -> void:
    if _attack_effect.active_cell == Vector2.ZERO:
        return

    _action_points.value -= _action_point_cost
    _attack_effect.do()

    refresh_cells()
    draw_cells()
