extends Node2D

var current_year = 2015

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

func _on_emissions_button_pressed() -> void:
	%EmissionsPopup.popup()

func _on_close_button_pressed() -> void:
	%EmissionsPopup.hide()
