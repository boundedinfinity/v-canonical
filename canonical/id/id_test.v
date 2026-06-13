module id_test

import canonical.id

fn test_id() {
	actual := id.new()

	assert actual.len == 36
}

