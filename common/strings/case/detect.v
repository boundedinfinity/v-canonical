module case

import strings

pub fn detect(v string) ?Case {
	if v.contains(' ') {
		return Case.phrase
	}

	if v.contains('_') {
		return Case.snake
	}

	if v.contains('-') {
		return Case.kabab
	}

	if !v.contains(' ') && !v.contains('-') && !v.contains('_') {
	}

	return none
}
