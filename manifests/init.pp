# modules/crypto/manifests/init.pp - manage crypto stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
# This modules mainly setup sime basic crypto stuff
#

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
