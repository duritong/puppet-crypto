class crypto::linux::centos inherits crypto::linux::base {
  Package[cryptsetup] {
    name => 'cryptsetup-luks',
  }
}
