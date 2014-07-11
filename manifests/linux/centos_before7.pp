class crypto::linux::centos_before7 inherits crypto::linux::base {
  Package[cryptsetup] {
    name => 'cryptsetup-luks',
  }
}
