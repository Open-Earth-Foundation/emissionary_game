extends Node

signal changed

const INITIAL_EMISSIONS_SECTOR1 := 1000000
const INITIAL_EMISSIONS_SECTOR2 := 1500000
const INITIAL_EMISSIONS_SECTOR3 := 2000000
const INITIAL_BUDGET := 10000000
const INITIAL_YEAR := 2015

var previous_policies = []
var current_year = INITIAL_YEAR
var budget = INITIAL_BUDGET
var emissions_sector1 = INITIAL_EMISSIONS_SECTOR1
var emissions_sector2 = INITIAL_EMISSIONS_SECTOR2
var emissions_sector3 = INITIAL_EMISSIONS_SECTOR3
var roi = 0

func reset() -> void:
	emissions_sector1 = INITIAL_EMISSIONS_SECTOR1
	emissions_sector2 = INITIAL_EMISSIONS_SECTOR2
	emissions_sector3 = INITIAL_EMISSIONS_SECTOR3
	roi = 0
	budget = INITIAL_BUDGET
	current_year = INITIAL_YEAR
	previous_policies.clear()

func get_initial_total_emissions() -> int:
	return INITIAL_EMISSIONS_SECTOR1 + INITIAL_EMISSIONS_SECTOR2 + INITIAL_EMISSIONS_SECTOR3

func get_total_emissions() -> int:
	return emissions_sector1 + emissions_sector2 + emissions_sector3
