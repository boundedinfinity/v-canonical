module affix_test

import canonical.person.affix

fn test_categorycase_parse() {
	category := affix.Category{
		name: 'General'
	}

	assert category.name == 'General'
	assert category.matches('general') == true
}




