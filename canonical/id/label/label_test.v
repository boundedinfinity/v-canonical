module label_test

import canonical.label
import canonical.id

fn test_category_no_id_parse() {
	actual := label.Label{
		name:          'Internet of Things'
		abbreviations: ['IoT']
	}

	assert actual.matches('Internet of Things') == true
	assert actual.matches('IOT') == true
	assert actual.id.len == 36
}

fn test_category_with_id() {
	aid := id.new()
	actual := label.Label{
		id:            aid
		name:          'Internet of Things'
		abbreviations: ['IoT']
	}

	assert actual.matches('Internet of Things') == true
	assert actual.matches('IOT') == true
	assert actual.id == aid
	assert actual.id.len == 36
}
