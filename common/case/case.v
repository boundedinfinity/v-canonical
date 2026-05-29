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
		"camel" { return .camel }
	}
}
