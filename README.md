1.  Download Hyrax BES RPMs from opendap.org

    $ ./fetch_hyrax_releases.bash

2.  Prepare virtual machine

    $ vagrant up --no-provision

3.  Run provision a first time (to get various dependencies)

    $ vagrant provision

4.  Run provision a second time (to focus on conflicts)

    $ vagrant provision


## Use `libdap` from EPEL

### Install `gdal-libs` from PGDG

    ==> default: + yum -y install gdal-libs-1.9.2-7.rhel6.x86_64

[...]

    ==> default: Dependencies Resolved
    ==> default: 
    ==> default: ================================================================================
    ==> default:  Package           Arch           Version                  Repository      Size
    ==> default: ================================================================================
    ==> default: Installing:
    ==> default:  gdal-libs         x86_64         1.9.2-7.rhel6            pgdg95         3.8 M
    ==> default: Installing for dependencies:
    ==> default:  libdap            x86_64         3.11.0-1.el6             epel           445 k

[...]

    ==> default: Installed:
    ==> default:   gdal-libs.x86_64 0:1.9.2-7.rhel6                                              
    ==> default: 
    ==> default: Dependency Installed:
    ==> default:   libdap.x86_64 0:3.11.0-1.el6                                                  
    ==> default: Complete!

### Try to install `bes` from opendap.org

    ==> default: + yum -y install /vagrant/hyrax_releases/binary/hyrax-1.13.1/centos6.6/bes-3.17.2-2.static.el6.x86_64.rpm

[...]

    ==> default: Resolving Dependencies
    ==> default: --> Running transaction check
    ==> default: ---> Package bes.x86_64 0:3.17.2-2.static.el6 will be installed
    ==> default: --> Processing Dependency: libdap >= 3.18.0 for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: --> Processing Dependency: libicu >= 3.6 for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: --> Processing Dependency: libdap.so.23()(64bit) for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: --> Processing Dependency: libdapclient.so.6()(64bit) for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: --> Processing Dependency: libicudata.so.42()(64bit) for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: --> Processing Dependency: libicui18n.so.42()(64bit) for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: --> Processing Dependency: libicuuc.so.42()(64bit) for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: --> Running transaction check
    ==> default: ---> Package bes.x86_64 0:3.17.2-2.static.el6 will be installed
    ==> default: --> Processing Dependency: libdap >= 3.18.0 for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: --> Processing Dependency: libdap.so.23()(64bit) for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: --> Processing Dependency: libdapclient.so.6()(64bit) for package: bes-3.17.2-2.static.el6.x86_64
    ==> default: ---> Package libicu.x86_64 0:4.2.1-14.el6 will be installed
    ==> default: --> Finished Dependency Resolution
    ==> default: Error: Package: bes-3.17.2-2.static.el6.x86_64 (/bes-3.17.2-2.static.el6.x86_64)
    ==> default:            Requires: libdapclient.so.6()(64bit)
    ==> default: Error: Package: bes-3.17.2-2.static.el6.x86_64 (/bes-3.17.2-2.static.el6.x86_64)
    ==> default:            Requires: libdap.so.23()(64bit)
    ==> default: Error: Package: bes-3.17.2-2.static.el6.x86_64 (/bes-3.17.2-2.static.el6.x86_64)
    ==> default:            Requires: libdap >= 3.18.0
    ==> default:            Installed: libdap-3.11.0-1.el6.x86_64 (@epel)
    ==> default:                libdap = 3.11.0-1.el6
    ==> default:  You could try using --skip-broken to work around the problem
    ==> default:  You could try running: rpm -Va --nofiles --nodigest

### Verify `libdap` is from EPEL

    ==> default: + yum list installed libdap

[...]

    ==> default: Installed Packages
    ==> default: libdap.x86_64                         3.11.0-1.el6                         @epel


## Use `libdap` from opendap.org

### Install `libdap` from opendap.org

    ==> default: + yum -y install /vagrant/hyrax_releases/binary/hyrax-1.13.1/centos6.6/libdap-3.18.0-1.el6.x86_64.rpm

[...]

    ==> default: Dependencies Resolved
    ==> default: 
    ==> default: ================================================================================
    ==> default:  Package    Arch       Version            Repository                       Size
    ==> default: ================================================================================
    ==> default: Installing:
    ==> default:  libdap     x86_64     3.18.0-1.el6       /libdap-3.18.0-1.el6.x86_64     2.6 M

[...]

    ==> default: Installed:
    ==> default:   libdap.x86_64 0:3.18.0-1.el6                                                  
    ==> default: Complete!

### Try to install `gdal-libs` from PGDG

    ==> default: + yum -y install gdal-libs-1.9.2-7.rhel6.x86_64

[...]

    ==> default: Resolving Dependencies
    ==> default: --> Running transaction check
    ==> default: ---> Package gdal-libs.x86_64 0:1.9.2-7.rhel6 will be installed
    ==> default: --> Processing Dependency: libdapclient.so.3()(64bit) for package: gdal-libs-1.9.2-7.rhel6.x86_64
    ==> default: --> Processing Dependency: libdap.so.11()(64bit) for package: gdal-libs-1.9.2-7.rhel6.x86_64
    ==> default: --> Finished Dependency Resolution
    ==> default: Error: Package: gdal-libs-1.9.2-7.rhel6.x86_64 (pgdg95)
    ==> default:            Requires: libdapclient.so.3()(64bit)
    ==> default:            Available: libdap-3.11.0-1.el6.x86_64 (epel)
    ==> default:                libdapclient.so.3()(64bit)
    ==> default:            Installed: libdap-3.18.0-1.el6.x86_64 (@/libdap-3.18.0-1.el6.x86_64)
    ==> default:                Not found
    ==> default: Error: Package: gdal-libs-1.9.2-7.rhel6.x86_64 (pgdg95)
    ==> default:            Requires: libdap.so.11()(64bit)
    ==> default:            Available: libdap-3.11.0-1.el6.x86_64 (epel)
    ==> default:                libdap.so.11()(64bit)
    ==> default:            Installed: libdap-3.18.0-1.el6.x86_64 (@/libdap-3.18.0-1.el6.x86_64)
    ==> default:                Not found
    ==> default:  You could try using --skip-broken to work around the problem
    ==> default:  You could try running: rpm -Va --nofiles --nodigest

### Verify using `libdap` from opendap.org

    ==> default: + yum list installed libdap

[...]

    ==> default: Installed Packages
    ==> default: libdap.x86_64             3.18.0-1.el6              @/libdap-3.18.0-1.el6.x86_64
