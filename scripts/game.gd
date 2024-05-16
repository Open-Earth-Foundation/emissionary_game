extends Node2D

var current_year = 2015

@onready var button: Button = %NextYearButton
@onready var year_label: Label = %YearLabel
@onready var decision_making = $DecisionMaking

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_next_year_button_pressed() -> void:
	current_year += 1
	decision_making.newPolicies(current_year)

func _on_emissions_button_pressed() -> void:
	%EmissionsPopup.show()

func _on_close_button_pressed() -> void:
	%EmissionsPopup.hide()
