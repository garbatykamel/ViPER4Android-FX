TIMEOFEXEC=1

# Keycheck binary by someone755 @Github, idea for code below by Zappo @xda-developers
KEYCHECK=$INSTALLER/common/keycheck
chmod 755 $KEYCHECK

chooseport() {
  $KEYCHECK
  INPUT=$?
  if [[ $INPUT -eq 42 ]] || [[ $INPUT -eq 21 ]]; then
    UI=$INPUT
  else
    ui_print "Unrecognized key! Using new V4A"
    UI=42
  fi
  shift
}

ui_print " "
ui_print "- Select Version -"
ui_print "   Choose which V4A you want installed:"
ui_print "   Vol+ = new (2.5.0.5), Vol- = old (2.3.4.0)"
ui_print "   Old V4A will install super quality driver"
chooseport
if [[ $UI -eq 21 ]]; then
  ui_print "   Old V4A will be installed"
  cp -f $INSTALLER/custom/Old/ViPER4Android-FX.apk $INSTALLER/system/app/ViPER4Android-FX/ViPER4Android-FX.apk
  cp -f $INSTALLER/custom/Old/libv4a_fx_jb_NEON.so $INSTALLER/custom/libv4a_fx_jb_NEON.so
  cp -f $INSTALLER/custom/Old/libv4a_fx_jb_X86.so $INSTALLER/custom/libv4a_fx_jb_X86.so
  sed -i 's/2.5.0.5/2.3.4.0/' $INSTALLER/module.prop
else
  ui_print "  New V4A will be installed"
fi
