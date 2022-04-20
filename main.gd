tool
extends Node

export(Array, PackedScene) var _initial_scenes


func _ready() -> void:
    for scene in _initial_scenes:
        var instance = scene.instance()

        if not get_node(instance.name):
            add_child(instance)
            instance.set_owner(get_tree().edited_scene_root)

    if not Engine.editor_hint:
        GroupController.add("Characters", get_node("World/Characters"))
        GroupController.add("TileMaps", get_node("World/TileMaps"))
        CameraController.init(get_node("World/Camera2D"))
        GameController.init()
        ActionController.init()
        AttackController.init()
        TurnController.init()
