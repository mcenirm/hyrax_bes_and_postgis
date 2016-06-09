#!/bin/bash

set -e
set -x

grep -q 'keepcache=0' /etc/yum.conf \
&& sed -i -e 's/^\(keepcache\)=0$/\1=1/' /etc/yum.conf

rpmquery --quiet epel-release \
|| yum -y install epel-release

rpmquery --quiet pgdg-centos95 \
|| yum -y install https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-6-x86_64/pgdg-centos95-9.5-2.noarch.rpm

rpmquery --quiet libdap.x86_64 \
&& yum -y erase libdap.x86_64

yum -y install gdal-libs-1.9.2-7.rhel6.x86_64
yum -y install /vagrant/hyrax_releases/binary/hyrax-1.13.1/centos6.6/bes-3.17.2-2.static.el6.x86_64.rpm \
&& { echo Did not expect that to work ; exit 1 ; }
yum list installed libdap

rpmquery --quiet libdap.x86_64 \
&& yum -y erase libdap.x86_64

yum -y install /vagrant/hyrax_releases/binary/hyrax-1.13.1/centos6.6/libdap-3.18.0-1.el6.x86_64.rpm
yum -y install gdal-libs-1.9.2-7.rhel6.x86_64 \
&& { echo Did not expect that to work ; exit 1 ; }
yum list installed libdap
