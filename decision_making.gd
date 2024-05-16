extends PopupPanel

@onready var policyList = $VBoxContainer/PolicyList
@onready var policyCard = $VBoxContainer/PolicyList/PolicyCard

var available_policies = [
	{
		"title": "Waste to energy plant",
		"description": "A plant for converting waste to energy",
		"cost": 500000
	},
	{
		"title": "Bus electrification program",
		"description": "Electrify buses"
	}
]

# Called when the node enters the scene tree for the first time.

func choose_policies(ap):
	return []
	
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
		newCard.get_node('PolicyTitle').text = policy.title
		newCard.get_node()
		policyList.add_child(newCard)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_apply_button_pressed():
	visible = false
