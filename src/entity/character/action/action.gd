class_name Action
extends Node

export var _tile_map_action_modulate: Color


func draw_action() -> void:
    ActionController.tile_map_action.clear()
    ActionController.tile_map_action.modulate = _tile_map_action_modulate


func do_action() -> void:
    pass
