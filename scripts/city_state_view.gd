extends Control

@onready var progress_bar = $ProgressBar
@onready var progress_bar_2 = $ProgressBar2
@onready var progress_bar_3 = $ProgressBar3

var max_emissions = 500 

func _ready():
	state_changed()
	CityState.changed.connect(state_changed) 
	
func state_changed():
	progress_bar.value = CityState.emissions_sector1 / max_emissions
	progress_bar_2.value = CityState.emissions_sector2 / max_emissions
	progress_bar_3.value = CityState.emissions_sector3 / max_emissions

