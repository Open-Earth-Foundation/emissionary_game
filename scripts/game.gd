extends Node2D

const FINAL_YEAR = 2031
var pledge = 0.30 # percent reduction

@onready var button: Button = %NextYearButton
@onready var year_label: Label = %YearLabel
@onready var money_label: Label = %MoneyLabel
@onready var decision_making = %DecisionMaking
@onready var roi_label: Label = %RoiLabel

func _ready() -> void:
	CityState.changed.connect(on_state_changed)
	$Intro.show()

func on_state_changed() -> void:
	year_label.text = str(CityState.current_year)
	money_label.text = "$" + str(CityState.budget)
	roi_label.text = "ROI: $" + str(CityState.roi)
	var progress := CityState.get_progress()
	%ReductionProgressLabel.text = "Emission Reduction Progress: " + str(round((1.0 - progress) * 100)) + "% / " + str(pledge * 100) + "%"

func _on_next_year_button_pressed() -> void:
	CityState.current_year += 1
	CityState.budget += CityState.roi
	CityState.changed.emit()
	decision_making.newPolicies(CityState.current_year)
	decision_making.show()
	
	if CityState.current_year >= FINAL_YEAR:
		%GameOverOverlay.show()
	
	var percent_reduction = CityState.get_total_emissions() / float(CityState.get_initial_total_emissions())
	print("red", percent_reduction)
	if percent_reduction < (1 - pledge):
		%WinOverlay.show()

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
