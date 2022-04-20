extends Node

var _non_player_controlled_characters: Array = []


func init() -> void:
    GroupController.get("Characters").connect("child_removed", self, "_on_group_characters_child_removed")

    for character in GroupController.get("Characters").all():
        if !character.is_in_group("PlayerControlled"):
            _non_player_controlled_characters.append(character)


func _on_group_characters_child_removed(child: Node) -> void:
    _non_player_controlled_characters.erase(child)
    
    if _non_player_controlled_characters.empty():
        get_tree().quit()
