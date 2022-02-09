extends Node

var _active_character: Character

onready var _character_turn_queue: Array = []


func init() -> void:
    _character_turn_queue = GroupController.get("Characters").all()
    start_next_turn()


func start_next_turn() -> void:
    if _active_character != null:
        _active_character.disconnect("turn_ended", self, "_on_active_character_turn_ended")
        _character_turn_queue.push_back(_active_character)
    
    _active_character = _character_turn_queue.pop_front()
    _active_character.connect("turn_ended", self, "_on_active_character_turn_ended")
    _active_character.start_turn()


func _on_active_character_turn_ended(character: Character) -> void:
    start_next_turn()
