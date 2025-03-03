extends Node

class_name Room  # Permite importar la clase directamente

var _ID = ""
var _doors = [0,0,0,0] #N S E O
var connected_rooms = []
# Constructor
func _init(ID):
	_ID = ID

func get_ID():
	return _ID
# Método para mostrar información
func has_door() -> bool:
	return true if 1 in _doors else false
	
func generate_door(count:int):
	for i in range(count):
		_doors[randi_range(0 ,_doors.size() -1 )] = 1 
	
func how_doors():
	var size = 0
	for i in range(_doors.size()):
		if _doors[i] == 1:
			size += 1
	return size
	
func see_doors():
	var aux = []
	if _doors[0] == 1:
		aux.append("Norte")
	if _doors[1] == 1:
		aux.append("Sur")
	if _doors[2] == 1:
		aux.append("Este")
	if _doors[3] == 1:
		aux.append("Oeste")
	return aux
		
func connect_room(new_room: Room):
	if new_room not in connected_rooms:
		connected_rooms.append(new_room)
		new_room.connect_room(self)

func show_connections():
	var names = connected_rooms.map(func(room): return room.get_ID())
	print(_ID, " está conectada con: ", names)
