class_name FloatingText
extends Node2D

var animation: String = "Float"
var label_text: String setget _set_label_text
var label_modulate: Color setget _set_label_modulate

onready var _animation_player: AnimationPlayer = get_node("AnimationPlayer")


func _ready():
    _animation_player.play(animation)


func _set_label_modulate(value: Color) -> void:
    get_node("Label").self_modulate = value


func _set_label_text(value: String) -> void:
    get_node("Label").text = value


func _on_AnimationPlayer_animation_finished(anim_name):
    queue_free()
