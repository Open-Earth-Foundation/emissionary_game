extends Control

@onready var progress_bar = $ProgressBar
@onready var progress_bar_2 = $ProgressBar2
@onready var progress_bar_3 = $ProgressBar3

func _ready():
	state_changed()
	CityState.changed.connect(state_changed)

func state_changed():
	progress_bar.value = 100 * CityState.emissions_sector1 / float(CityState.INITIAL_EMISSIONS_SECTOR1)
	progress_bar_2.value = 100 * CityState.emissions_sector2 / float(CityState.INITIAL_EMISSIONS_SECTOR2)
	progress_bar_3.value = 100 * CityState.emissions_sector3 / float(CityState.INITIAL_EMISSIONS_SECTOR3)
