class_name Action
extends Node

export var _tile_map_action_modulate: Color

var cells: Array
var current_cell: Vector2


func refresh_cells() -> void:
    cells.clear()


func draw_cells() -> void:
    ActionController.tile_map_action.clear()
    ActionController.tile_map_action.modulate = _tile_map_action_modulate

    for cell in cells:
        ActionController.tile_map_action.set_cellv(cell, ActionController.TILE_PRIMARY)


func draw_behaviour() -> void:
    pass


func do() -> void:
    pass
