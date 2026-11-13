# 2026-11-13T14:09:30.264704500
import vitis

client = vitis.create_client()
client.set_workspace(path="AIFES_1")

platform = client.get_component(name="AIfES_Platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../AIfES_Accel/AIfES.xsa")

status = platform.build()

comp = client.get_component(name="AIfES_component")
comp.set_app_config(key = "USER_COMPILE_DEFINITIONS", values = ["USE_HW_DENSE"])

comp.set_app_config(key = "USER_COMPILE_OPTIMIZATION_LEVEL", values = ["-O2"])

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../..", files=["hw_dense.h", "hw_dense.c"], dest_dir_in_cmp = "AIfES_component", is_skip_copy_sources = False)

status = platform.build()

comp = client.get_component(name="AIfES_component")
comp.build()

