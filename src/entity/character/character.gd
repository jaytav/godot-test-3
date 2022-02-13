class_name Character
extends Node2D

signal turn_started(character)
signal turn_ended(character)

onready var _state_machine: StateMachine = get_node("StateMachine")


func start_turn():
    _state_machine.transition_to_state("Active")
    emit_signal("turn_started", self)


func end_turn():
    _state_machine.transition_to_state("Idle")
    emit_signal("turn_ended", self)
