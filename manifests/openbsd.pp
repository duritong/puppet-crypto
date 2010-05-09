class crypto::openbsd {
    sysctl::set_value{"vm.swapencrypt.enable": value => "1"}
}

