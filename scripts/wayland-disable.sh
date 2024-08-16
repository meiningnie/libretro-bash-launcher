#!/bin/bash

GDM_CONF_PATH="/etc/gdm3/custom.conf"
if [[ ! -f "${GDM_CONF_PATH}" ]]; then
    echo "[error] ${GDM_CONF_PATH} does not exist!"
    exit 1
fi

WAYLAND_SUBSTR="WaylandEnable="
if [[ ! -n `grep "${WAYLAND_SUBSTR}" "${GDM_CONF_PATH}"` ]]; then
    sudo bash -c "echo ${WAYLAND_SUBSTR}false >> ${GDM_CONF_PATH}"
else
    sudo sed -i "/${WAYLAND_SUBSTR}/c\\${WAYLAND_SUBSTR}false" "${GDM_CONF_PATH}"
fi

echo "[done] Wayland has been disabled and will take effect after the next reboot."
