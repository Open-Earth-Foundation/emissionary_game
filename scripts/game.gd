extends Node2D

var current_year = 2015

@onready var button: Button = %NextYearButton
@onready var year_label: Label = %YearLabel

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_next_year_button_pressed() -> void:
	current_year += 1
	year_label.text = str(current_year)
