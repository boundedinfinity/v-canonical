module id

import rand

pub type Id = string

pub fn new_id() string {
	return rand.uuid_v4().to_upper()
}
