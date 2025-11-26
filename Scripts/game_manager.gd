extends Node
class_name GameManager

@onready var score_left_label: Label = $Score_Left
@onready var score_right_label: Label = $Score_Right

var score_left: int = 0
var score_right: int = 0

func add_point_left() -> void:
	score_left += 1
	score_left_label.text = str(score_left)

func add_point_right() -> void:
	score_right += 1
	score_right_label.text = str(score_right)

func reset_scores() -> void:
	score_left = 0
	score_right = 0
	score_left_label.text = "0"
	score_right_label.text = "0"
