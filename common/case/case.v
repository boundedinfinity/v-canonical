module case

import common.strings

pub enum Case as u8 {
	camel
	kabab
	kabab_upper
	snake
	snake_upper
	pascal
	phrase
}


pub fn parse(s string) ?Case {
	n := strings.lowercase(s)

	match n {
		"camel" { return Case.camel }
		"kabab" { return Case.kabab }
		"kabab_upper", "kabab-upper", "kabab upper" { return Case.kabab_upper }
		"snake" { return Case.snake }
		"snake_upper", "snake-upper", "snake upper" { return Case.snake_upper }
		"pascal" { return Case.pascal }
		"phrase" { return Case.phrase }
		else { return none }
	}
}


pub fn detect(v string) ?Case {
	return Case.phrase
}

pub fn convert(case Case, v string) string {
	return ""
}
