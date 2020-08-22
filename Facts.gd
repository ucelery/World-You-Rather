extends Node2D

signal win

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if (Global.turn == 20):
				emit_signal("win")
			queue_free()

func _ready():
	connect("win", get_parent(), "_on_Facts_win")
	z_index = 1000
	set_process_input(false)
	if (Global.sitArray[Global.turn] == 0):
		$Text1.text = "Transportation is a leading source of climate pollution. Short trips under three miles represent nearly half of all trips. With most trips within a 15- to 20-minute bike ride, many of these trips are perfect for walking and biking. "
	elif (Global.sitArray[Global.turn] == 1 ):
		$Text1.text = "It would take between 20 and 100 uses for a reusable cup to make up for the greenhouse gas emissions of a single-use cup."
	elif (Global.sitArray[Global.turn] == 2 ):
		$Text1.text = "Like many plastic items, cutlery often finds its way into the environment, where it poses dangers for animals and can take hundreds of years to break down."
	elif (Global.sitArray[Global.turn] == 3):
		$Text1.text = "Hand-washing uses 34,200 gallons of water to a dishwasher’s 16,300 gallons over 10 years. In short, a dishwasher that’s being used correctly emits 63 percent fewer emissions in its entire lifecycle."
	elif (Global.sitArray[Global.turn] == 4):
		$Text1.text = "A cleanup program can not only reduce pollution, but by sorting neighborhood trash and recycling as much as possible, can help to teach residents about recycling and about activities that will reduce the neighborhood's carbon footprint."
	elif (Global.sitArray[Global.turn] == 5 ):
		$Text1.text = "The most effective way to reduce waste is to not create it in the first place. Making a new product requires a lot of materials and energy - raw materials must be extracted from the earth, and the product must be fabricated then transported to wherever it will be sold. As a result, reduction and reuse are the most effective ways you can save natural resources, protect the environment and save money."
	elif (Global.sitArray[Global.turn] == 6 ):
		$Text1.text = "Reusing old items can help avoid a waste of energy and raw materials. It can also help reduce the amount of material sent to landfills."
	elif (Global.sitArray[Global.turn] == 7 ):
		$Text1.text = "A pair of jeans requires 2,000 gallons of water and the dye used for that is released directly into rivers and streams, raising the risk of exposure to heavy metals for both people and animals in the surrounding areas. "
	elif (Global.sitArray[Global.turn] == 8 ):
		$Text1.text = "Paper bags are destined for the same fate as disposable plastic bags when shoppers opt to carry their purchases home in reusable bags. By eliminating paper bags fewer resources are wasted."
	elif (Global.sitArray[Global.turn] == 9 ):
		$Text1.text = "Plastic is one of the most persistent pollutants on Earth. It's made to last - and it does, often for 400 years or more. And at every step in its lifecycle, even long after it has been discarded, plastic creates greenhouse gas emissions that are contributing to the warming of our world."
	elif (Global.sitArray[Global.turn] == 10 ):
		$Text1.text = "Reducing electricity use in your home or going off the power grid with solar energy –can benefit the environment, conserve resources and save lives."
	elif (Global.sitArray[Global.turn] == 11 ):
		$Text1.text = "60% of clothes made worldwide are made from synthetic materials (polyster, nylon, acrylic), a.k.a plastic. When thrown away, they often sit in landfills for hundreds of years, if not forever."
	elif (Global.sitArray[Global.turn] == 12 ):
		$Text1.text = "Plastics require about 700 years to dissolve, meaning they accumulate rapidly in the environment and have negative impacts for centuries."
	elif (Global.sitArray[Global.turn] == 13 ):
		$Text1.text = "When you consume less power, you reduce the amount of toxic fumes released by power plants, conserve the earth’s natural resources and protect ecosystems from destruction."
	elif (Global.sitArray[Global.turn] == 14 ):
		$Text1.text = "Global warming is caused primarily from putting too much carbon into the atmosphere when coal, gas, and oil are burned to generate electricity or to run our cars. These gases spread around the planet like a blanket, keeping in solar heat that would otherwise be radiated out into space."
	elif (Global.sitArray[Global.turn] == 15 ):
		$Text1.text = "If paper is recycled, it doesn't end up in the wastestream. instead, it heads towards a lanfill where it will degrade and generate methane. Simply put, the less paper landfilled, the less methane emitted."
	elif (Global.sitArray[Global.turn] == 16 ):
		$Text1.text = "Toilet paper's impact is even more severe because, it is so short-lived, it quickly releases its remaining carbon into the atmosphere. That is why, according to the Environmental Paper Network, toilet paper made from trees has three times the climate impact as toilet paper created using recycled materials."
	elif (Global.sitArray[Global.turn] == 17 ):
		$Text1.text = "About 11% of all the greenhouse gas emissions that come from the food system could be reduced if we stop wasting food."
	elif (Global.sitArray[Global.turn] == 18 ):
		$Text1.text = "The paper cycle involves a broad range of natural resource and environmental impacts because fiber supply relies on trees, paper manufacturing requires fuel inputs, and paper waste disposal can contribute to emissions of the potent greenhouse gas."
	elif (Global.sitArray[Global.turn] == 19 ):
		$Text1.text = "The process of manufacturing paper releases nitrogen dioxide, sulfur dioxide, and carbon dioxide into the air, contributing to pollution such as acid rain and greenhouse gases."

var count = 3
func _on_Timer_timeout():
	if (count > 0):
		count -= 1
		$Counter.text = str(count)
	else:
		set_process_input(true)
		$Timer.stop()
		$Counter.text = "Click anywhere to continue!"
