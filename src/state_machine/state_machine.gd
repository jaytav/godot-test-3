class_name StateMachine
extends Node

signal transitioned(from_state, to_state)

export(NodePath) var _initial_state

var _active_state: State


func _init() -> void:
    connect("transitioned", self, "_on_StateMachine_transitioned")


func _ready() -> void:
    yield(owner, "ready")
    transition_to_state(_initial_state)
    

func _process(delta: float) -> void:
    _active_state.process(delta)


func _physics_process(delta: float) -> void:
    _active_state.physics_process(delta)
    

func _unhandled_input(event: InputEvent) -> void:
    _active_state.unhandled_input(event)


func transition_to_state(state: String) -> void:
    var from_state: State = _active_state
    var to_state: State = get_node(state)

    if from_state:
        _active_state.exit()

    _active_state = to_state
    _active_state.enter()

    emit_signal("transitioned", from_state, _active_state)


func _on_StateMachine_transitioned(from_state: State, to_state: State) -> void:
    if from_state:
        print("%s.%s transitioned from %s to %s" % [owner.name, name, from_state.name, to_state.name])
    else:
        print("%s.%s transitioned to %s" % [owner.name, name, to_state.name])
