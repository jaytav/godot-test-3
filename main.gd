tool
extends Node

export(Array, PackedScene) var _initial_scenes


func _ready():
    for scene in _initial_scenes:
        var instance = scene.instance()

        if !has_node(instance.name):
            add_child(instance)
            instance.set_owner(get_tree().edited_scene_root)
