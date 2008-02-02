# modules/crypto/manifests/init.pp - manage crypto stuff
# Copyright (C) 2007 admin@immerda.ch
#

#modules_dir { "crypto": }

class crypto {
        case $kernel {
                linux: { include crypto::luks }
                openbsd: { include crypto::openbsd }
        }
}

class crypto::luks {
    package{cryptsetup-luks:
        ensure => present,
        category => $operatingsystem ? {
            gentoo => 'sys-fs',
            default => '',
        },
    }


    case $operatingsystem {
        debian,ubuntu: {
            Package{cryptsetup-luks:
                name => 'cryptsetup',
            }
        }
    }
}

class crypto::openbsd {
    sysctl::set_value{"vm.swapencrypt.enable": value => "1"}
}

