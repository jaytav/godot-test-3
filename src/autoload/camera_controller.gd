extends Node


var _camera: Camera2D
var _follow_speed: float = 200
var _follow_entity: Node2D


func _process(delta) -> void:
    if !_follow_entity or _camera.position.distance_to(_follow_entity.position) < 1:
        return

    var direction = _camera.position.direction_to(_follow_entity.position)
    _camera.position += direction * _follow_speed * delta


func init(camera: Camera2D) -> void:
    _camera = camera

    for character in GroupController.get("Characters").all():
        character.connect("turn_started", self, "_on_character_turn_started")


func _on_character_turn_started(character: Character) -> void:
    _follow_entity = character
