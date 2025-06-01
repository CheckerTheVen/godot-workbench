extends Control

## Defines the text to be displayed in the scene.
@export var text: String

@onready var text_node = get_node("Text")

func _ready() -> void:
    text_node.text = text
