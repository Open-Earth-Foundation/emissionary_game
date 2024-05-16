extends PopupPanel

@onready var policyList = $VBoxContainer/PolicyList
@onready var policyCard = $VBoxContainer/PolicyList/PolicyCard

var sector_names = {
	"I": "Stationary Energy",
	"II": "Transportation",
	"III": "Waste"
}

# Called when the node enters the scene tree for the first time.
	
func _ready():
	pass

func newPolicies(year):
	var policies = choose_policies(Policies.available)
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
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_apply_button_pressed():
	hide()
	
func choose_policies(ap):
	return ap
