module strings_test

import common.strings

fn test_uncapitalize() {
	assert strings.String('').uncapitalize() == ''
	assert strings.String('a').uncapitalize() == 'a'
	assert strings.String('A').uncapitalize() == 'a'
	assert strings.String('AB').uncapitalize() == 'aB'
	assert strings.String('aB').uncapitalize() == 'aB'
	assert strings.String('ab').uncapitalize() == 'ab'
}
