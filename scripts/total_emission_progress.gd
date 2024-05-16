extends PopupPanel

@onready var progress_bar = $ProgressBar

var emission_reduction_target = 10
var emissions_sector1 = 100
var emissions_sector2 = 150 
var emissions_sector3 = 200 

func _ready():
	progress_updated()

func progress_updated():
	var total_starting_emissions = emissions_sector1 + emissions_sector2 + emissions_sector3
	var current_total_emissions = CityState.emissions_sector1 + CityState.emissions_sector2 + CityState.emissions_sector3

	var reduction = total_starting_emissions - current_total_emissions
	var reduction_percentage = (reduction / total_starting_emissions) * 100

	progress_bar.value = reduction_percentage
	
