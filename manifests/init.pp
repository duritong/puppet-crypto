# modules/crypto/manifests/init.pp - manage crypto stuff
# Copyright (C) 2007 admin@immerda.ch
#

modules_dir { "crypto": }

class crypto {
        case $operatingsystem {
                centos: { $luks = "true" }
                gentoo: { $luks = "true" }
                default: { $luks = "false" }
        }

        if $luks {
                package { 'cryptsetup-luks':
                        ensure => present,
                        category => $operatingsystem ? {
                                gentoo => 'sys-fs',
                                default => '',
                        },
                }
        }
}

