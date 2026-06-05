module strings_test

import common.strings.case

fn test_join() {
	assert case.camel_to_kebab('abcd') == 'abcd'
	assert case.camel_to_kebab('Abcd') == 'abcd'
	assert case.camel_to_kebab('abCd') == 'ab-cd'
	assert case.camel_to_kebab('abcD') == 'abc-d'
	assert case.camel_to_kebab('') == ''

	assert case.camel_to_kebab_upper('abcd') == 'ABCD'
	assert case.camel_to_kebab_upper('Abcd') == 'ABCD'
	assert case.camel_to_kebab_upper('abCd') == 'AB-CD'
	assert case.camel_to_kebab_upper('abcD') == 'ABC-D'
	assert case.camel_to_kebab_upper('') == ''

	assert case.camel_to_pascal('abcd') == 'Abcd'
	assert case.camel_to_pascal('') == ''

	assert case.camel_to_phrase('abcd') == 'abcd'
	assert case.camel_to_phrase('Abcd') == 'abcd'
	assert case.camel_to_phrase('abCd') == 'ab cd'
	assert case.camel_to_phrase('abcD') == 'abc d'
	assert case.camel_to_phrase('') == ''

	assert case.camel_to_phrase_title('abcd') == 'Abcd'
	assert case.camel_to_phrase_title('Abcd') == 'Abcd'
	assert case.camel_to_phrase_title('abCd') == 'Ab Cd'
	assert case.camel_to_phrase_title('abcD') == 'Abc D'
	assert case.camel_to_phrase_title('') == ''

	assert case.camel_to_snake('abcd') == 'abcd'
	assert case.camel_to_snake('Abcd') == 'abcd'
	assert case.camel_to_snake('abCd') == 'ab_cd'
	assert case.camel_to_snake('abcD') == 'abc_d'
	assert case.camel_to_snake('') == ''

	assert case.camel_to_snake_upper('abcd') == 'ABCD'
	assert case.camel_to_snake_upper('Abcd') == 'ABCD'
	assert case.camel_to_snake_upper('abCd') == 'AB_CD'
	assert case.camel_to_snake_upper('abcD') == 'ABC_D'
	assert case.camel_to_snake_upper('') == ''

	assert case.kebab_to_camel('abcd') == 'abcd'
	assert case.kebab_to_camel('a-bcd') == 'aBcd'
	assert case.kebab_to_camel('ab-cd') == 'abCd'
	assert case.kebab_to_camel('abc-d') == 'abcD'
	assert case.kebab_to_camel('') == ''

	assert case.kebab_to_pascal('abcd') == 'Abcd'
	assert case.kebab_to_pascal('Abcd') == 'Abcd'
	assert case.kebab_to_pascal('ab-cd') == 'AbCd'
	assert case.kebab_to_pascal('abc-d') == 'AbcD'
	assert case.kebab_to_pascal('') == ''
	
	assert case.kebab_to_phrase('abcd') == 'abcd'
	assert case.kebab_to_phrase('Abcd') == 'abcd'
	assert case.kebab_to_phrase('ab-cd') == 'ab cd'
	assert case.kebab_to_phrase('abc-d') == 'abc d'
	assert case.kebab_to_phrase('') == ''

	assert case.kebab_to_phrase_title('abcd') == 'Abcd'
	assert case.kebab_to_phrase_title('Abcd') == 'Abcd'
	assert case.kebab_to_phrase_title('ab-cd') == 'Ab Cd'
	assert case.kebab_to_phrase_title('abc-d') == 'Abc D'
	assert case.kebab_to_phrase_title('') == ''
	
	assert case.kebab_to_snake('abcd') == 'abcd'
	assert case.kebab_to_snake('a-bcd') == 'a_bcd'
	assert case.kebab_to_snake('ab-cd') == 'ab_cd'
	assert case.kebab_to_snake('abc-d') == 'abc_d'
	assert case.kebab_to_snake('') == ''

	assert case.kebab_to_snake_upper('abcd') == 'ABCD'
	assert case.kebab_to_snake_upper('a-bcd') == 'A_BCD'
	assert case.kebab_to_snake_upper('ab-cd') == 'AB_CD'
	assert case.kebab_to_snake_upper('abc-d') == 'ABC_D'
	assert case.kebab_to_snake_upper('') == ''

	assert case.pascal_to_camel('abcd') == 'abcd'
	assert case.pascal_to_camel('Abcd') == 'abcd'
	assert case.pascal_to_camel('AbCd') == 'abCd'
	assert case.pascal_to_camel('AbcD') == 'abcD'
	assert case.pascal_to_camel('') == ''

	assert case.pascal_to_kebab('abcd') == 'abcd'
	assert case.pascal_to_kebab('Abcd') == 'abcd'
	assert case.pascal_to_kebab('AbCd') == 'ab-cd'
	assert case.pascal_to_kebab('AbcD') == 'abc-d'
	assert case.pascal_to_kebab('') == ''

	assert case.pascal_to_kebab_upper('abcd') == 'ABCD'
	assert case.pascal_to_kebab_upper('Abcd') == 'ABCD'
	assert case.pascal_to_kebab_upper('AbCd') == 'AB-CD'
	assert case.pascal_to_kebab_upper('AbcD') == 'ABC-D'
	assert case.pascal_to_kebab_upper('') == ''

	assert case.pascal_to_phrase('abcd') == 'abcd'
	assert case.pascal_to_phrase('Abcd') == 'abcd'
	assert case.pascal_to_phrase('AbCd') == 'ab cd'
	assert case.pascal_to_phrase('AbcD') == 'abc d'
	assert case.pascal_to_phrase('') == ''

	assert case.pascal_to_phrase_title('abcd') == 'Abcd'
	assert case.pascal_to_phrase_title('Abcd') == 'Abcd'
	assert case.pascal_to_phrase_title('AbCd') == 'Ab Cd'
	assert case.pascal_to_phrase_title('AbcD') == 'Abc D'
	assert case.pascal_to_phrase_title('') == ''

	assert case.pascal_to_snake('abcd') == 'abcd'
	assert case.pascal_to_snake('Abcd') == 'abcd'
	assert case.pascal_to_snake('AbCd') == 'ab_cd'
	assert case.pascal_to_snake('AbcD') == 'abc_d'
	assert case.pascal_to_snake('') == ''

	assert case.pascal_to_snake_upper('abcd') == 'ABCD'
	assert case.pascal_to_snake_upper('Abcd') == 'ABCD'
	assert case.pascal_to_snake_upper('AbCd') == 'AB_CD'
	assert case.pascal_to_snake_upper('AbcD') == 'ABC_D'
	assert case.pascal_to_snake_upper('') == ''

	assert case.snake_to_camel('abcd') == 'abcd'
	assert case.snake_to_camel('a_bcd') == 'aBcd'
	assert case.snake_to_camel('abc_d') == 'abcD'

	assert case.snake_to_kabab('abcd') == 'abcd'
	assert case.snake_to_kabab('a_bcd') == 'a-bcd'
	assert case.snake_to_kabab('abc_d') == 'abc-d'

	assert case.snake_to_kabab_upper('abcd') == 'ABCD'
	assert case.snake_to_kabab_upper('a_bcd') == 'A-BCD'
	assert case.snake_to_kabab_upper('abc_d') == 'ABC-D'

	assert case.snake_to_pascal('abcd') == 'Abcd'
	assert case.snake_to_pascal('a_bcd') == 'ABcd'
	assert case.snake_to_pascal('abc_d') == 'AbcD'

	assert case.snake_to_phrase('abcd') == 'abcd'
	assert case.snake_to_phrase('a_bcd') == 'a bcd'
	assert case.snake_to_phrase('abc_d') == 'abc d'

	assert case.snake_to_phrase_title('abcd') == 'Abcd'
	assert case.snake_to_phrase_title('a_bcd') == 'A Bcd'
	assert case.snake_to_phrase_title('abc_d') == 'Abc D'
}
