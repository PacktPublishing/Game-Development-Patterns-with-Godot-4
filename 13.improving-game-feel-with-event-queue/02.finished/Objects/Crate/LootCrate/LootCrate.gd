extends Crate


func shatter():
	for loot in $Loots.get_children():
		loot.drop()
	super()
