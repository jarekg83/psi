# psi

This is a PSI-IM (http://psi-im.org) Dockerfile.

Master branch contains a build instructions based on Unbutu base image.

There is a CentOS branch which uses CentOS 7 image however there are some well known locales issues with CentOS 7
and PSI displays some weird characters. 

This repo is being synched back to my docker hub:
https://hub.docker.com/r/jarekg83/psi/

and image is being build automatically so you can pull it by

`docker pull jarekg83/psi`

# How to use it?
well run it with (if you want to detach it -d or run -ti if you don't):
`docker run -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v PATH_TO_YOUR_PSI_CONF_DIR:/root/.config/psi` 

Mounting DISPLAY and /tmp/.x11-unix is necessary to run X app from the container on your host.
PATH_TO_YOUR_PSI_CONF_DIR is necessary if you want your changes and config to be persistent.

# Bugs and issues
Please raise through GitHub. I know PSI can be a bit flakey but not sure if this is docker or QT5 (XCB) issues.

For example:
`[20171006 12:13:05] W:QXcbConnection: XCB error: 2 (BadValue), sequence: 1644, resource id: 353, major code: 130 (Unknown), minor code: 3 (unknown:0, unknown)
[20171006 12:13:05] W:QXcbConnection: XCB error: 2 (BadValue), sequence: 1645, resource id: 353, major code: 130 (Unknown), minor code: 3 (unknown:0, unknown)
[20171006 12:13:05] W:QXcbConnection: XCB error: 2 (BadValue), sequence: 1647, resource id: 353, major code: 130 (Unknown), minor code: 3 (unknown:0, unknown)`

