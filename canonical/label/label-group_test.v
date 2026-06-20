module label_test

import canonical.label
import canonical.id

fn test_category_no_id() {
	mut actual := label.LabelGroup{
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

	actual.add(label.Label{
		name: 'Label 2'
	})

	assert actual.matches('Internet of Things') == true
	assert actual.matches('IOT') == true
	assert actual.matches('SecuritY') == true
	assert actual.matches('AutomaTion') == true
	assert actual.matches('Label 2') == true

	actual.add([
		label.Label{
			name: 'Label 3'
		},
		label.Label{
			name: 'Label 4'
		},
	])

	assert actual.matches('Internet of Things') == true
	assert actual.matches('IOT') == true
	assert actual.matches('SecuritY') == true
	assert actual.matches('AutomaTion') == true
	assert actual.matches('Label 2') == true
	assert actual.matches('Label 3') == true
	assert actual.matches('Label 4') == true

	actual.add(label.LabelGroup{
		name:          'Internet of Things'
		abbreviations: ['IoT']
		labels:        [
			label.Label{
				name: 'Label 5'
			},
			label.Label{
				name: 'Label 6'
			},
		]
	})

	assert actual.matches('Internet of Things') == true
	assert actual.matches('IOT') == true
	assert actual.matches('SecuritY') == true
	assert actual.matches('AutomaTion') == true
	assert actual.matches('Label 2') == true
	assert actual.matches('Label 3') == true
	assert actual.matches('Label 4') == true
	assert actual.matches('Label 5') == true
	assert actual.matches('Label 7') == true
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


