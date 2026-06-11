module affix_test

import canonical.person.affix

fn test_categorycase_parse() {
	category := affix.Category{
		name: 'General'
	}

	prefix := affix.Prefix{
		name:          'Mister'
		abbreviations: ['Mr']
		category:      category
	}

	assert prefix.matches('mister') == true
	assert prefix.matches('mr') == true
}
