class_name AttackEffect
extends RelativePointsAction

export var damage: int

var _effected_characters: Dictionary
var _floating_texts: Array


func refresh_cells() -> void:
    cells.clear()

    for relative_point in _relative_points:
        cells.append(active_cell + relative_point)


func draw_cells() -> void:
    clear()

    AttackController.tile_map.modulate = _tile_map_action_modulate

    for character in GroupController.get("Characters").all():
        var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(character.position)

        if !cells.has(character_cell):
            continue

        var floating_text: FloatingText = Character.FloatingText.instance()
        floating_text.label_text = str(damage)
        floating_text.label_modulate = _tile_map_action_modulate
        floating_text.animation = "FloatLoop"
        character.add_child(floating_text)
        
        _floating_texts.append(floating_text)
        _effected_characters[character_cell] = character

    for cell in cells:
        if _effected_characters.has(cell):
            continue
        
        AttackController.tile_map.set_cellv(cell, ActionController.TILE_PRIMARY)


func do() -> void:
    for character in _effected_characters.values():
        var character_health_points: Stat = character.get_node("Stats/HealthPoints")
        character_health_points.value -= damage


func clear() -> void:
    AttackController.tile_map.clear()
    
    for floating_text in _floating_texts:
        _floating_texts.erase(floating_text)
        floating_text.queue_free()
