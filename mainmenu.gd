extends Control

func _on_city_builder_gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        pass # TODO Start game `City Builder`

func _on_options_gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        pass # TODO Open options menu (WIP)

# Notifies all nodes of the upcoming termination of the program.
func _on_exit_gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
        get_tree().quit(0)
