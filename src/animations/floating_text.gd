class_name FloatingText
extends Node2D

var label_text: String
var label_modulate: Color

onready var _label: Label = get_node("Label")


func _ready():
    _label.text = label_text
    _label.self_modulate = label_modulate


func _on_AnimationPlayer_animation_finished(anim_name):
    queue_free()
