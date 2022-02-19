class_name Stat
extends Node

signal updated(stat, from_value, to_value)

export var _initial_value: int
export var modulate: Color

var value: int setget _set_value


func _ready() -> void:
    value = _initial_value


func _set_value(to_value: int) -> void:
    var from_value: int = value
    value = to_value

    emit_signal("updated", self, from_value, value)
