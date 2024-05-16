extends Node2D

var current_year = 2015
const FINAL_YEAR = 2031

@onready var button: Button = %NextYearButton
@onready var year_label: Label = %YearLabel
@onready var money_label: Label = %MoneyLabel
@onready var decision_making = $DecisionMaking

func _ready() -> void:
	CityState.changed.connect(on_state_changed)

func on_state_changed() -> void:
	money_label.text = "$" + str(CityState.budget)

func _on_next_year_button_pressed() -> void:
	current_year += 1
	year_label.text = str(current_year)
	decision_making.newPolicies(current_year)
	decision_making.popup()
	
	if current_year >= FINAL_YEAR:
		%GameOverOverlay.show()

func _on_emissions_button_pressed() -> void:
	%EmissionsPopup.popup()

func _on_close_button_pressed() -> void:
	%EmissionsPopup.hide()

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
