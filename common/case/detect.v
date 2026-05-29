module case



pub fn detect(v string) ?Case {
	if v.contains(" ") {
		return Case.phrase
	}

	if v.contains("_") {
		return Case.snake
	}

	if v.contains("-") {
		return Case.kabab
	}

	return none
}

