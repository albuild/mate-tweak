# albuild-mate-tweak

Yet another unofficial MATE Tweak package for Amazon Linux 2.

## Install (Amazon WorkSpaces)

### System Requirements

* Python: `sudo yum install python3-devel`
* Python Modules:
    * psutil: `sudo pip3 install psutil`
    * PyGObject: `sudo pip3 install PyGObject`
        * To install PyGObject, you also need the following packages:
            * cairo-gobject-devel: `sudo yum install cairo-gobject-devel`
            * gobject-introspection-devel: `sudo yum install gobject-introspection-devel`
    * setproctitle `sudo pip3 install setproctitle`

### Instructions

1. Download the prebuilt package from [the Release page](https://github.com/albuild/mate-tweak/releases/tag/v0.1.0).

1. Install the package.

    ```
    sudo yum -y install mate-tweak-0.1.0-1.amzn2.x86_64.rpm
    ```

1. Logout and login.

## Build (Amazon WorkSpaces)

### System Requirements

* Docker

### Instructions

1. Clone this repository.

    ```
    git clone https://github.com/albuild/mate-tweak.git
    ```

1. Go to the repository.

    ```
    cd mate-tweak
    ```

1. Build a new image.

    ```
    bin/build
    ```

1. Extract built packages from the built image. The packages will be copied to the ./rpm directory.

    ```
    bin/cp
    ```

1. Delete the built image.

    ```
    bin/rmi
    ```
