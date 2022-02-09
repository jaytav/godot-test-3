extends Node

var _groups: Dictionary = {}


class Group:
    var _parent: Node
    var _children: Dictionary = {}

    func init(parent: Node) -> void:
        _parent = parent
 
        for child in parent.get_children():
            _children[child.name] = child

    func get(child_name: String) -> Node:
        return _children[child_name] if _children.has(child_name) else null

    func all() -> Array:
        return _children.values()
        

func get(group_name: String) -> Group:
    return _groups[group_name] if _groups.has(group_name) else null


func add(group_name: String, parent: Node) -> void:
    _groups[group_name] = Group.new()
    _groups[group_name].init(parent)
