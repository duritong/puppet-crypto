# modules/crypto/manifests/init.pp - manage crypto stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
# This modules mainly setup sime basic crypto stuff
#
class crypto {
  case $::operatingsystem {
    'CentOS': {
      if versioncmp($::operatingsystemmajrelease,'7') < 0 {
        include ::crypto::linux::centos_before7
      } else {
        include ::crypto::linux::base
      }
    }
    'Gentoo': { include ::crypto::linux::gentoo }
    'OpenBSD': { include ::crypto::openbsd }
    default: {
      case $::kernel {
        'Linux': { include ::crypto::linux::base }
        default: {}
      }
    }
  }
}
