    brew install swig
    sudo sh -c 'curl -L https://cpanmin.us | perl - App::cpanminus'
    sudo cpanm -q -n PDL Mouse Function::Parameters Hash::Ordered PDL::CCS


    MXNET_HOME=/Users/daniel/mxnet
    export PERL5LIB=${HOME}/perl5/perlbrew/perls/perl-5.30.2/lib/5.30.2

    cd ${MXNET_HOME}/perl-package/AI-MXNetCAPI/
    perl Makefile.PL INSTALL_BASE=${HOME}/perl5/perlbrew/perls/perl-5.30.2
    make
    install_name_tool -change lib/libmxnet.dylib \
        ${MXNET_HOME}/build/libmxnet.dylib \
        blib/arch/auto/AI/MXNetCAPI/MXNetCAPI.bundle
    make install

    cd ${MXNET_HOME}/perl-package/AI-NNVMCAPI/
    perl Makefile.PL INSTALL_BASE=${HOME}/perl5/perlbrew/perls/perl-5.30.2
    make
    install_name_tool -change lib/libmxnet.dylib \
            ${MXNET_HOME}/build/libmxnet.dylib \
            blib/arch/auto/AI/NNVMCAPI/NNVMCAPI.bundle
    make install

    cd ${MXNET_HOME}/perl-package/AI-MXNet/
    perl Makefile.PL INSTALL_BASE=${HOME}/perl5/perlbrew/perls/perl-5.30.2
    make install