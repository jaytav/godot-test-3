class_name Character
extends Node2D

signal turn_started(character)
signal turn_ended(character)

const FloatingText: PackedScene = preload("res://src/animations/floating_text.tscn")

onready var _state_machine: StateMachine = get_node("StateMachine")


func _ready() -> void:
    for stat in get_node("Stats").get_children():
        stat.connect("updated", self, "_on_stat_updated")


func start_turn() -> void:
    _state_machine.transition_to_state("Active")
    emit_signal("turn_started", self)


func end_turn() -> void:
    _state_machine.transition_to_state("Idle")
    emit_signal("turn_ended", self)


func _on_stat_updated(stat: Stat, from_value: int, to_value: int) -> void:
    var difference: int = to_value - from_value

    if difference == 0:
        return

    var floating_text: FloatingText = FloatingText.instance()
    floating_text.label_text = str(difference)
    floating_text.label_modulate = stat.modulate
    add_child(floating_text)

    if stat.name == "HealthPoints" and to_value == 0:
        GroupController.get("Characters").emit_signal("child_removed", self)
        ActionController.refresh_astar_movement()
        yield(floating_text, "tree_exited")

        queue_free()
