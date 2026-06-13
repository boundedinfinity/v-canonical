module affix_test

import canonical.person.affix
import canonical.id

fn test_affix() {
	aid := id.new()

	category := affix.Category{
		name: 'General'
	}

	actual := affix.Prefix{
		id:            aid
		name:          'Mister'
		abbreviations: ['Mr']
		category:      category
	}

	assert actual.matches('mister') == true
	assert actual.matches('mr') == true
	assert actual.id.len == 36
}
