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
        if not _children.has(child_name):
            return null

        return _children[child_name]


func get(group_name: String) -> Group:
    if not _groups.has(group_name):
        return null

    return _groups[group_name]


func add(group_name: String, parent: Node) -> void:
    var group: Group = Group.new()
    group.init(parent)

    _groups[group_name] = group
