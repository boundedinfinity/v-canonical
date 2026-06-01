module strings_test

import common.strings

fn test_uncapitalize() {
	assert strings.uncapitalize('') == ''
	assert strings.uncapitalize('a') == 'a'
	assert strings.uncapitalize('A') == 'a'
	assert strings.uncapitalize('AB') == 'aB'
	assert strings.uncapitalize('aB') == 'aB'
	assert strings.uncapitalize('ab') == 'ab'
}
