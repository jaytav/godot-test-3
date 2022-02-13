extends State


func enter():
    for status_effect in owner.get_node("StatusEffects").get_children():
        status_effect.do()
