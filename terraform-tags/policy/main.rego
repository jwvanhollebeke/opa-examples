# Adapted from Scalr sample terraform policies
# FROM: https://github.com/Scalr/sample-tf-opa-policies/blob/master/management/resource_tags.rego

package terraform

required_tags = ["required-tag"]

array_contains(arr, elem) {
	arr[_] = elem
}

get_tags(resource) = tags {
	tags := resource.change.after.tags
} else = empty {
	empty := {}
}

deny[reason] {
	resource := input.resource_changes[_]
	tags := get_tags(resource)

	actual_tags := [key | tags[key]]
	required_tag := required_tags[_]
	not array_contains(actual_tags, required_tag)

	reason := sprintf(
		"%s: missing required tag %q",
		[resource.address, required_tag],
	)
}
