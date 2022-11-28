plan customfact::request (
  TargetSpec $targets
) {
  $api_key = lookup('customfact::api_key')
  out::message($api_key)
  $result  = run_task('customfact', $targets, 'api_key' => $api_key)
  return $result
}
