# modules/crypto/manifests/init.pp - manage crypto stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
# This modules mainly setup sime basic crypto stuff
#

#modules_dir { "crypto": }

class crypto {
    case $operatingsystem {
        centos: { include crypto::linux::centos }
        gentoo: { include crypto::linux::gentoo }
        openbsd: { include crypto::openbsd }
        default: { 
            case $kernel {
                linux: { include crypto::linux::base }
            }
        }
    }
}

class crypto::linux::base {
    package{cryptsetup:
        ensure => present,
    }
}

class crypto::linux::centos inherits crypto::linux::base {    
    Package[cryptsetup] {
        name => 'cryptsetup-luks',
    }
}

class crypto::linux::gentoo inherits crypto::linux::base {    
    Package[cryptsetup] {
        category => 'sys-fs',
    }
}

class crypto::openbsd {
    sysctl::set_value{"vm.swapencrypt.enable": value => "1"}
}

