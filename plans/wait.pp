plan reboot::wait(
  TargetSpec $targets,
  Optional[String] $message = undef,
  Integer[1] $reboot_delay = 1,
  Integer[0] $disconnect_wait = 10,
  Integer[0] $reconnect_timeout = 180,
  Integer[0] $retry_interval = 1,
  Boolean    $fail_plan_on_errors = true,
) {
  $target_objects = get_targets($targets)
  ctrl::do_until() || {
  wait_until_available($target_objects, wait_time => $reconnect_timeout, retry_interval => $retry_interval)
  }
}