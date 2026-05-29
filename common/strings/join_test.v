module strings_test

import common.strings

fn test_join() {
	a := ['a', 'b']
	assert strings.join(a, ' ') == 'a b'
}
