# Public: Add a Homebrew formula to the boxen/brews tap
#
define homebrew::formula($source = undef) {
  require homebrew

  $caller_module_name_that_works = inline_template('<%= scope.parent.to_hash["name"].split("::").first %>')

  $formula_source = $source ? {
    undef   => "puppet:///modules/${caller_module_name_that_works}/brews/${name}.rb",
    default => $source
  }

  ensure_resource('file', "${homebrew::tapsdir}/boxen", {
    'ensure' => 'directory',
    'owner'  => $::boxen_user,
    'group'  => 'staff'
  })

  ensure_resource('file', "${homebrew::tapsdir}/boxen/homebrew-brews", {
    'ensure' => 'directory',
    'owner'  => $::boxen_user,
    'group'  => 'staff'
  })

  ensure_resource('file', "${homebrew::tapsdir}/boxen/homebrew-brews/.git", {
    'ensure' => 'directory',
    'owner'  => $::boxen_user,
    'group'  => 'staff'
  })

  file { "${homebrew::config::tapsdir}/boxen/homebrew-brews/${name}.rb":
    source  => $formula_source
  }

}
