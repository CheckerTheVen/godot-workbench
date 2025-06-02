extends Control

func _on_city_builder_gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        pass # TODO Start game `City Builder`

func _on_options_gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        pass # TODO Open options menu (WIP)

func _on_exit_gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        pass # TODO Close application
