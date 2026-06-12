module label_test

import canonical.label

fn test_categorycase_parse() {
	actual := label.LabelGroup{
		name:          'Internet of Things'
		abbreviations: ['IoT']
		labels:        [
			label.Label{
				name: 'Security'
			},
			label.Label{
				name: 'Automation'
			},
		]
	}

	assert actual.matches('Internet of Things') == true
	assert actual.matches('IOT') == true
	assert actual.matches('SecuritY') == true
	assert actual.matches('AutomaTion') == true
}
