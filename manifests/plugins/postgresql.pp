# postgresql plugin
#
class collectd::plugins::postgresql (
  $queries,
  $databases
) {
  validate_hash($queries)
  validate_hash($databases)
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
  include collectd
  
  collectd::plugins::plugin_common { 'postgresql':
    package_name         => 'collectd-postgresql',
    plugin_file_name     => '10-postgresql.conf',
    plugin_template_name => 'postgresql.conf.erb'
  }
}