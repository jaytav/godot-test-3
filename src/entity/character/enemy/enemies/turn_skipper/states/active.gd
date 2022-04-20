extends State

onready var _animation_player = get_node("AnimationPlayer")


func enter() -> void:
    _animation_player.play("Jump")


func _on_AnimationPlayer_animation_finished(anim_name):
    owner.end_turn()
