package terraform

test_required_tags_allowed {
	result = deny with input as data.fixtures.allowed
	count(result) == 0
}

test_tags_null_denied {
	result = deny with input as data.fixtures.tags_null
	count(result) >= 1
}

test_missing_required_tag_denied {
	result = deny with input as data.fixtures.missing_required_tag
	count(result) >= 1
}
