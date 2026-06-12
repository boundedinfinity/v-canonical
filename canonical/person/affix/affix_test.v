module affix_test

import canonical.person.affix

fn test_categorycase_parse() {
	category := affix.Category{
		name: 'General'
	}

	actual := affix.Prefix{
		name:          'Mister'
		abbreviations: ['Mr']
		category:      category
	}

	assert actual.matches('mister') == true
	assert actual.matches('mr') == true
}

