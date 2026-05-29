module strings_test

import common.strings

fn test_join() {
	input1 := ['a', 'b']
	actual1 := input1.join(' ')
	assert actual1 == 'a b'

	input2 := [strings.String('a'), 'b']
	actual2 := input2.join(' ')
	assert actual2 == 'a b'
}
