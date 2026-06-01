module case

// import common.strings

pub enum Case as u8 {
	camel
	kabab
	kabab_upper
	pascal
	phrase
	phrase_title
	snake
	snake_upper
}


pub fn parse(s string) ?Case {
	n := s.to_lower()

	match n {
		"camel" { return Case.camel }
		"kabab" { return Case.kabab }
		"kabab_upper", "kabab-upper", "kabab upper" { return Case.kabab_upper }
		"pascal" { return Case.pascal }
		"phrase" { return Case.phrase }
		"phrase_title", "phrase title" { return Case.phrase }
		"snake" { return Case.snake }
		"snake_upper", "snake-upper", "snake upper" { return Case.snake_upper }
		else { return none }
	}
}

// pub fn convert(from Case, to Case, s string) string {
// 	mut cs := strings.String(s)

// 	match from {
// 		.camel { cs = cs.camel_to_phrase() }
// 		else {}
// 	}

// 	return v
// }
