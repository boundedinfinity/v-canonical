module label_test

import canonical.label
import canonical.id

fn test_category_no_id() {
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


fn test_category_with_id() {
	aid := id.new()
	actual := label.LabelGroup{
		id:            aid
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
	assert actual.id == aid
}
