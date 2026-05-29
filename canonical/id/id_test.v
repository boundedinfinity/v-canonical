module id_test

import canonical.id

fn test_id() {
	actual := id.new_id()
		
	assert actual.len == 36
}
