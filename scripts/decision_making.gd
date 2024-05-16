extends PopupPanel

@onready var policyList = $VBoxContainer/PolicyList
@onready var policyCard = $VBoxContainer/PolicyCard

func newPolicies(year):
	var policies = choose_policies(Policies.available)
	var selected_policies = []
	for i in 3:
		selected_policies.push_back(policies.pick_random())

	for previous_card in policyList.get_children():
		previous_card.queue_free()

	for policy in selected_policies:
		var newCard = policyCard.duplicate()
		policyList.add_child(newCard)
		newCard.show()
		newCard.get_node('PolicyTitle').text = policy['name']
		newCard.get_node('PolicyDescription').text = policy['description']
		newCard.get_node('PolicySectorContainer/PolicySector').text = policy['sector']
		newCard.get_node('PolicyImpactContainer/PolicyImpact').text = str(policy['emission reduction']) + "t CO2eq"
		var cost := int(policy['cost'])
		newCard.get_node('PolicyPropertiesContainer/PolicyCostContainer/PolicyCost').text = "$" + str(cost)
		newCard.get_node('PolicyPropertiesContainer/PolicyROIContainer/PolicyROI').text = "$" + str(policy['roi'])
		newCard.set_meta("policy", policy)
		
		if cost > CityState.budget:
			newCard.get_node('CheckButton').disabled = true
	show()

func _on_apply_button_pressed():
	for policy_card in policyList.get_children():
		var is_selected: bool = policy_card.get_node("CheckButton").button_pressed
		if is_selected:
			apply_policy(policy_card.get_meta("policy"))
	CityState.changed.emit()
	hide()

func choose_policies(ap):
	return ap

func apply_policy(policy: Dictionary) -> void:
	match policy.sector:
		"Energy":
			CityState.emissions_sector1 -= int(policy["emission reduction"])
		"Transport":
			CityState.emissions_sector2 -= int(policy["emission reduction"])
		"Waste":
			CityState.emissions_sector3 -= int(policy["emission reduction"])
	CityState.roi += int(policy.roi)
	CityState.budget -= int(policy.cost)
	CityState.previous_policies.push_back(policy)
