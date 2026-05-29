module case_test

import common.case

fn test_case_parse() {
	mut actual := case.parse("snake") or { panic("parse didnt' work") }
	assert actual == case.Case.snake

	actual = case.parse("snake-upper") or { panic("parse didnt' work") }
	assert actual == case.Case.snake_upper
}

fn test_case_convert() {
	mut actual := case.parse("snake") or { panic("parse didnt' work") }
	assert actual == case.Case.snake
}
