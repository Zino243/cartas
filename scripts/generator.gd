
extends Node2D

#region Nuevo Code Region
#var dungeon_difficult = 7
#var stack = []
#var dungeon = []
#var count_rooms = 4 # +1 que es el spawn
#
#var spawn = "🟨"
#var green = "🟩"
#var red =   "🟥"
#
#func insert_stack(coords: Vector2i):
	#stack.push_back(Vector2i(coords.y,coords.x)) # Invert values
	#
#func generate_spawn():
	## generate xrandom and y random
	#var coords = Vector2i(randi_range(0,dungeon_difficult -1 ),randi_range(0,dungeon_difficult -1 ))
	#dungeon[coords.y][coords.x] = spawn	
	#insert_stack(coords) # send X first and i don't like it
	#
#func choose_cross_movement():
	#var x = randi_range(-1,1)
	#var y = 0 if x != 0 else randi_range(0,1) * 2 -1
	#
	#return Vector2i(y, x )	
		#
#func generate_rooms():
	#for i in range(count_rooms):
		## need gen x coord and y coord
		#var aux = choose_cross_movement()  # return a vector -> (0, -1)
		#var aux_stack = stack.back()	   # return a last vector to slack x is y FUCK
		#var xy = [aux_stack.x + aux.x , aux_stack.y + aux.y]
		#print(aux_stack)
		#print(" = ", i, " ", aux_stack.x + aux.x, " ", aux_stack.y + aux.y)
		#
		#if dungeon[xy[1]][xy[0]] == red:
			#dungeon[xy[1]][xy[0]] = green
			#insert_stack(Vector2i(xy[1], xy[0]))
			#
		#
		##insert_stack(Vector2i(aux_stack.x,aux_stack.y))
		##print(stack)
		#
#func _ready() -> void:
	## generate blank dungeon
	#for i in dungeon_difficult:
		#dungeon.append([])  # Agregar una nueva fila vacía
		#for j in range(dungeon_difficult):
			#dungeon[i].append(red)  # Llenar la fila con "0"
	#
	#var i = True
	#While i:
		#generate_spawn()
		#print(stack)
		#generate_rooms()
		#
		#var spawner = stack.front()
		#if spawner.x[-1] == green or spawner.x[-1] == green or \
		#spawner.y[-1] == green or spawner.y[-1] == green:
			#pass
		#else:
			#stack.clear()
			#generate_spawn()
			#generate_rooms()
	#
		#
	#
	#
	#
	##show dungeon
	#for i in dungeon:
		#print(i)
#endregion

var Room_class = load("res://scripts/room_class.gd")

func _ready() -> void:
	var rooms = []
	for i in range(5):
		var room = Room_class.new(str(i))
		room.generate_door(2)
		print(room.how_doors())
		print(room.see_doors())
		
		if rooms.size() > 0:  # Asegurar que hay al menos una habitación antes de conectar
			room.connect_room(rooms.back())  # Conecta con la última habitación agregada
		
		rooms.append(room)
		
	if rooms.size() > 0:
		rooms.back().connect_room(rooms.front())
		rooms.back().connect_room(rooms[2])
		
	for i in rooms:
		i.show_connections()
