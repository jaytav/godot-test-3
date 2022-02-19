extends Node

const TILE_PRIMARY = 0

var tile_map: TileMap


func init() -> void:
    tile_map = GroupController.get("TileMaps").get("Attack")
