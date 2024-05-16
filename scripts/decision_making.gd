extends PopupPanel

@onready var policyList = $VBoxContainer/PolicyList
@onready var policyCard = $VBoxContainer/PolicyList/PolicyCard

var sector_names = {
	"I": "Stationary Energy",
	"II": "Transportation",
	"III": "Waste"
}

var available_policies = [
	{
		"title": "Waste to energy plant",
		"description": "A plant for converting waste to energy",
		"sector": "III",
		"cost": 500000,
		"impact": 300000,
		"roi": 60000
	},
	{
		"title": "Bus electrification program",
		"description": "Electrify buses",
		"sector": "II",
		"cost": 500000,
		"impact": 100000,
		"roi": 50000
	}
]

# Called when the node enters the scene tree for the first time.
	
func _ready():
	var policies = choose_policies(available_policies)
	var seenOnce = false
	for policy in policies:
		var newCard
		if seenOnce:
			newCard = policyCard.duplicate()
		else:
			newCard = policyCard
			seenOnce = true
		newCard.get_node('PolicyTitle').text = policy['title']
		newCard.get_node('PolicyDescription').text = policy['description']
		newCard.get_node('PolicySectorContainer/PolicySector').text = sector_names[policy['sector']]
		newCard.get_node('PolicyImpactContainer/PolicyImpact').text = str(policy['impact']) + "t CO2eq"
		newCard.get_node('PolicyPropertiesContainer/PolicyCostContainer/PolicyCost').text = "$" + str(policy['cost'])
		newCard.get_node('PolicyPropertiesContainer/PolicyROIContainer/PolicyROI').text = "$" + str(policy['roi'])
		policyList.add_child(newCard)

func newPolicies(year):
	show()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_apply_button_pressed():
	hide()
	
func choose_policies(ap):
	return ap
