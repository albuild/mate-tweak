Summary: Yet another unofficial MATE Tweak package for Amazon Linux 2
Name: albuild-mate-tweak
Version: 0.1.0
Release: 1%{?dist}
Group: User Interface/Desktops
License: BSD-3-Clause
Source0: https://github.com/ubuntu-mate/mate-tweak/archive/18.10.2.tar.gz
URL: https://github.com/albuild/mate-tweak
BuildArch: x86_64
AutoReqProv: no

%description
Yet another unofficial MATE Tweak package for Amazon Linux 2.

%install
cp -r /dest/* %{buildroot}/

%clean
rm -rf %{buildroot}

%files
