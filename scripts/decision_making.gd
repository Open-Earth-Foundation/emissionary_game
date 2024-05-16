extends PopupPanel

@onready var policyList = $VBoxContainer/PolicyList
@onready var policyCard = $VBoxContainer/PolicyList/PolicyCard

func newPolicies(year):
	var policies = choose_policies(Policies.available)
	var seenOnce = false
	for policy in policies:
		var newCard
		if seenOnce:
			newCard = policyCard.duplicate()
			policyList.add_child(newCard)
		else:
			newCard = policyCard
			seenOnce = true
		newCard.get_node('PolicyTitle').text = policy['title']
		newCard.get_node('PolicyDescription').text = policy['description']
		newCard.get_node('PolicySectorContainer/PolicySector').text = policy['sector']
		newCard.get_node('PolicyImpactContainer/PolicyImpact').text = str(policy['impact']) + "t CO2eq"
		newCard.get_node('PolicyPropertiesContainer/PolicyCostContainer/PolicyCost').text = "$" + str(policy['cost'])
		newCard.get_node('PolicyPropertiesContainer/PolicyROIContainer/PolicyROI').text = "$" + str(policy['roi'])
		newCard.set_meta("policy", policy)
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
			CityState.emissions_sector1 -= policy.impact
		"Transport":
			CityState.emissions_sector2 -= policy.impact
		"Waste":
			CityState.emissions_sector3 -= policy.impact
	CityState.roi += policy.roi
	CityState.budget -= policy.cost
	CityState.previous_policies.push_back(policy)
