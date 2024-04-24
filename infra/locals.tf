locals {
  open_ai_instance_models = flatten([
    for instance in var.open_ai_instances : [
      for model in instance.models : {
        instance_name = instance.name
        model_name    = model.name
        model_version = model.version
      }
    ]
  ])
}
