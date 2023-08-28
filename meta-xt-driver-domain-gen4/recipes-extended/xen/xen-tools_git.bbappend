PACKAGECONFIG:append = " \
    xsm \
"
SRC_URI += " \
    file://weston-env.conf \
"

FILES:${PN}-flask = " \
    /boot/xenpolicy-${XEN_REL}* \
"

FILES:${PN}-devd:remove = "${sysconfdir}/systemd/system/xendriverdomain.service.d/weston-env.conf"

do_install:append() {
    rm ${D}${sysconfdir}/systemd/system/xendriverdomain.service.d/weston-env.conf
    rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}/systemd/system/xendriverdomain.service.d
    rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}/systemd/system
    rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}/systemd
}
