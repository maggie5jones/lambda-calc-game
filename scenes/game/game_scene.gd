class_name GameScene
extends Node2D

var game_end = false;

var moves = 0
var complete_sound = preload("res://assets/jingles_PIZZI16.ogg")

var Wall = preload("res://scenes/game/characters/wall.tscn")
var Player = preload("res://scenes/game/characters/player.tscn")
var Lambda = preload("res://scenes/game/characters/extras/lambda.tscn")
var Period = preload("res://scenes/game/characters/extras/period.tscn")

var TrueSlime = preload("res://scenes/game/characters/higherlevel/True.tscn")
var FalseSlime = preload("res://scenes/game/characters/higherlevel/False.tscn")
var FunctionSlime = preload("res://scenes/game/characters/higherlevel/function.tscn")

var VariableX = preload("res://scenes/game/characters/variables/variablex.tscn")
var VariableY = preload("res://scenes/game/characters/variables/variabley.tscn")
var VariableZ = preload("res://scenes/game/characters/variables/variablez.tscn")

var LeftParens = preload("res://scenes/game/characters/extras/left_parens.tscn")
var RightParens = preload("res://scenes/game/characters/extras/right_parens.tscn")

var XGoal = preload("res://scenes/game/characters/goals/goalx.tscn")
var YGoal = preload("res://scenes/game/characters/goals/goaly.tscn")
var ZGoal = preload("res://scenes/game/characters/goals/goalz.tscn")

var LParGoal = preload("res://scenes/game/characters/goals/lpargoal.tscn")
var RParGoal = preload("res://scenes/game/characters/goals/rpargoal.tscn")

var LambdaGoal = preload("res://scenes/game/characters/goals/lambdagoal.tscn")
var PeriodGoal = preload("res://scenes/game/characters/goals/pergoal.tscn")


func generate_level(level_data: Variant) -> void:
	# var best_moves = Global.get_best_record()
	# if best_moves <= 0:
	# 	best_moves = ""
	# $MarginContainer/VBoxContainer/BestMovesContainer/BestMovesLabel.text = "Best Moves: " + str(best_moves)
	$MarginContainer/VBoxContainer/LevelContainer/LevelLabel.text = "Level: " + str(Global.level_index + 1)

	var row_index: int = 0
	var c_index: int = 0
	for row in level_data:
		c_index = 0
		for c in row:
			if c == "#": #wall char
				var wall = Wall.instantiate()
				$Walls.add_child(wall)
				wall.position.x = c_index * 64
				wall.position.y = row_index * 64
			if c == "@": #player char
				var player = Player.instantiate()
				$Players.add_child(player)
				player.position.x = c_index * 64
				player.position.y = row_index * 64


			if c == "/": #lambda char
				var lambda = Lambda.instantiate()
				$Lambdas.add_child(lambda)
				lambda.position.x = c_index * 64
				lambda.position.y = row_index * 64
			if c == ".": #period char
				var period = Period.instantiate()
				$Periods.add_child(period)
				period.position.x = c_index * 64
				period.position.y = row_index * 64
			if c == "(": #left parens char
				var lpar = LeftParens.instantiate()
				$LeftParens.add_child(lpar)
				lpar.position.x = c_index * 64
				lpar.position.y = row_index * 64
			if c == ")": #right parens char
				var rpar = RightParens.instantiate()
				$RightParens.add_child(rpar)
				rpar.position.x = c_index * 64
				rpar.position.y = row_index * 64
			
			if c == "T": #true char
				var t = TrueSlime.instantiate()
				$Bools.add_child(t)
				t.position.x = c_index * 64
				t.position.y = row_index * 64
			if c == "F": #false char
				var f = FalseSlime.instantiate()
				$Bools.add_child(f)
				f.position.x = c_index * 64
				f.position.y = row_index * 64
			if c == "f": #function char (for Y combinator)
				var fun = FunctionSlime.instantiate()
				$Funcs.add_child(fun)
				fun.position.x = c_index * 64
				fun.position.y = row_index * 64


			if c == "X" or c == "x": #x variable char
				var variablex = VariableX.instantiate()
				$VariableXs.add_child(variablex)
				variablex.position.x = c_index * 64
				variablex.position.y = row_index * 64
			if c == "Y" or c == "y": #y variable char
				var variabley = VariableY.instantiate()
				$VariableYs.add_child(variabley)
				variabley.position.x = c_index * 64
				variabley.position.y = row_index * 64
			if c == "Z" or c == "z": #z variable char
				var variablez = VariableZ.instantiate()
				$VariableZs.add_child(variablez)
				variablez.position.x = c_index * 64
				variablez.position.y = row_index * 64


			if c == "8": #lambda goal
				var lamgoal = LambdaGoal.instantiate()
				$LambdaGoals.add_child(lamgoal)
				lamgoal.position.x = c_index * 64
				lamgoal.position.y = row_index * 64
			if c == "7": #period goal
				var pergoal = PeriodGoal.instantiate()
				$PeriodGoals.add_child(pergoal)
				pergoal.position.x = c_index * 64
				pergoal.position.y = row_index * 64
			if c == "9": #left parens goal
				var lpargoal = LParGoal.instantiate()
				$LParGoals.add_child(lpargoal)
				lpargoal.position.x = c_index * 64
				lpargoal.position.y = row_index * 64
			if c == "0": #right parens goal
				var rpargoal = RParGoal.instantiate()
				$RParGoals.add_child(rpargoal)
				rpargoal.position.x = c_index * 64
				rpargoal.position.y = row_index * 64


			if c == "1": #x variable goal
				var xgoal = XGoal.instantiate()
				$XGoals.add_child(xgoal)
				xgoal.position.x = c_index * 64
				xgoal.position.y = row_index * 64
			if c == "2": #y variable goal
				var ygoal = YGoal.instantiate()
				$YGoals.add_child(ygoal)
				ygoal.position.x = c_index * 64
				ygoal.position.y = row_index * 64
			if c == "3": #z variable goal
				var zgoal = ZGoal.instantiate()
				$ZGoals.add_child(zgoal)
				zgoal.position.x = c_index * 64
				zgoal.position.y = row_index * 64
			c_index += 1
		row_index+= 1


func cleanup_level(node: Node) -> void:
	for child in node.get_children():
		node.remove_child(child)
		child.queue_free()


func _ready():
	if len(Global.level_data[Global.mod_pack_id][Global.level_pack_id]) <= Global.level_index:
		# All level solved, return to main scene
		get_tree().change_scene_to_file("res://scenes/main/main_scene.tscn")
	else:
		generate_level(Global.level_data[Global.mod_pack_id][Global.level_pack_id][Global.level_index])


func _process(_delta):
	$MarginContainer/VBoxContainer/MovesContainer/MovesLabel.text = "Moves: " + str(moves)
	$Players.get_child(0)  # TODO: handle with multiple children
	var xvargoals = $XGoals.get_child_count()
	for i in $XGoals.get_children():
		if i.occupied:
			xvargoals -=1
	var yvargoals = $YGoals.get_child_count()
	for j in $YGoals.get_children():
		if j.occupied:
			yvargoals -=1
	var zvargoals = $ZGoals.get_child_count()
	for k in $ZGoals.get_children():
		if k.occupied:
			zvargoals -=1

	var lambdagoals = $LambdaGoals.get_child_count()
	for k in $LambdaGoals.get_children():
		if k.occupied:
			lambdagoals -=1
	var periodgoals = $PeriodGoals.get_child_count()
	for k in $PeriodGoals.get_children():
		if k.occupied:
			periodgoals -=1
	var leftpargoals = $LParGoals.get_child_count()
	for k in $LParGoals.get_children():
		if k.occupied:
			leftpargoals -=1
	var rightpargoals = $RParGoals.get_child_count()
	for k in $RParGoals.get_children():
		if k.occupied:
			rightpargoals -=1
	
#	if xvargoals == 0 and yvargoals == 0 and zvargoals == 0 and game_end == false:
	if (xvargoals + yvargoals + zvargoals + lambdagoals + 
		periodgoals + leftpargoals + rightpargoals) == 0 and game_end == false:
		Global.save_best_record(moves)
		$ProceedButton.show()
		$AudioStreamPlayer2D.stream = complete_sound
		$AudioStreamPlayer2D.play()
		game_end = true
