resource "google_cloudfunctions2_function_iam_binding" "cloudfunctions2_function_iam_bindings" {
  for_each = var.cloudfunctions2_function_iam_bindings

  cloud_function = each.value.cloud_function
  members        = each.value.members
  role           = each.value.role
  location       = each.value.location
  project        = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

