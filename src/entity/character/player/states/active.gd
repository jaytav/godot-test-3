extends State


func unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_select"):
        owner.end_turn()
