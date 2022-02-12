extends StatusEffect

export var _stat_path: NodePath

onready var _stat: Stat = get_node(_stat_path)


func do():
    _stat.value = _stat.max_value
