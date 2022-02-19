extends Node

var _groups: Dictionary = {}


class Group:
    signal child_removed(child)
    
    var _parent: Node
    var _children: Dictionary = {}
    
    func init(parent: Node) -> void:
        connect("child_removed", self, "_on_child_removed")
        _parent = parent
 
        for child in parent.get_children():
            _children[child.name] = child

    func get(child_name: String) -> Node:
        return _children[child_name] if _children.has(child_name) else null

    func all() -> Array:
        return _children.values()

    func _on_child_removed(child: Node) -> void:
        _children.erase(child.name)


func get(group_name: String) -> Group:
    return _groups[group_name] if _groups.has(group_name) else null


func add(group_name: String, parent: Node) -> void:
    _groups[group_name] = Group.new()
    _groups[group_name].init(parent)
