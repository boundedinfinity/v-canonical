module label_test

import canonical.label

fn test_categorycase_parse() {
	actual := label.Label{
		name:          'Internet of Things'
		abbreviations: ['IoT']
	}

	assert actual.matches('Internet of Things') == true
	assert actual.matches('IOT') == true
}

