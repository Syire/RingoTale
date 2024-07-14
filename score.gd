extends Control

var score = 0
var score_label
# Chiamato all'inizializzazione del nodo
func _ready():
	# Trova il nodo Label all'interno del Control
	score_label = $Label

# Funzione per aggiornare lo score e l'etichetta
func update_score(new_score):
	score = new_score
	score_label.text = "Score: " + str(score)
