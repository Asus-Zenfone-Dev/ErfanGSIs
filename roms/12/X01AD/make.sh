#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

# Copy changes in system folder
rsync -ra $thispath/system/ $1/

# Audio from device/asus/X01AD/system.prop
echo "af.fast_track_multiplier=1" >> $1/build.prop
echo "audio.deep_buffer.media=true" >> $1/build.prop
echo "audio.offload.min.duration.secs=30" >> $1/build.prop
echo "audio.offload.video=true" >> $1/build.prop
echo "ro.af.client_heap_size_kbyte=7168" >> $1/build.prop

# Bluetooth from device/asus/X01AD/system.prop
echo "vendor.bluetooth.soc=pronto" >> $1/build.prop

# Camera from device/asus/X01AD/system.prop
echo "persist.vendor.camera.expose.aux=1" >> $1/build.prop
echo "vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera,com.qualcomm.qti.qmmi,com.longcheertel.cit" >> $1/build.prop
echo "vendor.camera.lowpower.record.enable=1" >> $1/build.prop
echo "vidc.enc.dcvs.extra-buff-count=2" >> $1/build.prop

# Charger from device/asus/X01AD/system.prop
echo "ro.charger.disable_init_blank=true" >> $1/build.prop
echo "ro.charger.enable_suspend=true" >> $1/build.prop

# CnE from device/asus/X01AD/system.prop
echo "persist.vendor.cne.feature=1" >> $1/build.prop

# Data modules from device/asus/X01AD/system.prop
echo "persist.vendor.data.mode=concurrent" >> $1/build.prop
echo "ro.vendor.use_data_netmgrd=true" >> $1/build.prop

# Graphics from device/asus/X01AD/system.prop
echo "debug.sf.disable_backpressure=1" >> $1/build.prop
echo "debug.sf.hw=0" >> $1/build.prop
echo "debug.sf.latch_unsignaled=0" >> $1/build.prop
echo "persist.demo.hdmirotationlock=false" >> $1/build.prop
echo "ro.surface_flinger.force_hwc_copy_for_virtual_displays=true" >> $1/build.prop
echo "ro.surface_flinger.max_virtual_display_dimension=4096" >> $1/build.prop
echo "ro.surface_flinger.vsync_event_phase_offset_ns=4000000" >> $1/build.prop
echo "ro.surface_flinger.vsync_sf_event_phase_offset_ns=8000000" >> $1/build.prop
echo "vendor.display.disable_skip_validate=1" >> $1/build.prop

# Media from device/asus/X01AD/system.prop
echo "media.stagefright.thumbnail.prefer_hw_codecs=true" >> $1/build.prop
echo "vendor.mm.enable.qcom_parser=1048575" >> $1/build.prop
echo "vendor.vidc.dec.downscalar_height=1088" >> $1/build.prop
echo "vendor.vidc.dec.downscalar_width=1920" >> $1/build.prop
echo "vendor.vidc.enc.disable_bframes=1" >> $1/build.prop
echo "vendor.video.disable.ubwc=1" >> $1/build.prop

# QC framework value-adds from device/asus/X01AD/system.prop
echo "ro.vendor.qti.va_aosp.support=1" >> $1/build.prop

# Radio from device/asus/X01AD/system.prop
echo "DEVICE_PROVISIONED=1" >> $1/build.prop
echo "ril.subscription.types=NV,RUIM" >> $1/build.prop
echo "telephony.lteOnCdmaDevice=1" >> $1/build.prop

# Bpf from device/asus/X01AD/system.prop
echo "ro.kernel.ebpf.supported=1" >> $1/build.prop

# Append usefull stuff
echo "ro.support_one_handed_mode=true" >> $1/build.prop
echo "ro.boot.vendor.overlay.theme=com.google.android.systemui.gxoverlay" >> $1/product/etc/build.prop
echo "ro.config.ringtone=The_big_adventure.ogg" >> $1/product/etc/build.prop
echo "ro.config.notification_sound=Popcorn.ogg" >> $1/product/etc/build.prop
echo "ro.config.alarm_alert=Bright_morning.ogg" >> $1/product/etc/build.prop
echo "persist.sys.overlay.pixelrecents=true" >> $1/product/etc/build.prop
echo "qemu.hw.mainkeys=0" >> $1/product/etc/build.prop
echo "ro.opa.eligible_device=true" >> $1/product/etc/build.prop
echo "ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent" >> $1/product/etc/build.prop
echo "ro.com.android.dataroaming=false" >> $1/product/etc/build.prop
echo "ro.com.google.clientidbase=android-google" >> $1/product/etc/build.prop
echo "ro.error.receiver.system.apps=com.google.android.gms" >> $1/product/etc/build.prop
echo "ro.com.google.ime.theme_id=5" >> $1/product/etc/build.prop
echo "ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms" >> $1/product/etc/build.prop
echo "ro.com.google.ime.height_ratio=1.0" >> $1/product/etc/build.prop

# Drop some services
sed -i "/dataservice_app/d" $1/product/etc/selinux/product_seapp_contexts
sed -i "/dataservice_app/d" $1/system_ext/etc/selinux/system_ext_seapp_contexts
sed -i "/ro.sys.sdcardfs/d" $1/product/etc/build.prop
