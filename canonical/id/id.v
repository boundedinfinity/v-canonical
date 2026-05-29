module id

import common.strings
import rand

pub type Id = string

pub fn new_id() string {
	return strings.uppercase(rand.uuid_v4())
}
