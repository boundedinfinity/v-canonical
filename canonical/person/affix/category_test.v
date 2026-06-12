module affix_test

import canonical.person.affix

fn test_categorycase_parse() {
	actual := affix.Category{
		name: 'General'
	}

	assert actual.name == 'General'
	assert actual.matches('general') == true
}




