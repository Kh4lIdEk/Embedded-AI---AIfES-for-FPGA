# 2026-11-06T13:59:49.350738800
import vitis

client = vitis.create_client()
client.set_workspace(path="AIFES_1")

platform = client.create_platform_component(name = "AIfES_Platform",hw_design = "$COMPONENT_LOCATION/../AIfES_1_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

comp = client.create_app_component(name="AIfES_component",platform = "$COMPONENT_LOCATION/../AIfES_Platform/export/AIfES_Platform/AIfES_Platform.xpfm",domain = "standalone_ps7_cortexa9_0")

comp = client.get_component(name="AIfES_component")
status = comp.import_files(from_loc="", files=["C:\Users\micro\Downloads\main_AIfES.c", "C:\Users\micro\Downloads\f32\mnist-mlp-3layers-0frozen-pretrained-crossentropy-adam\aifes_f32_fnn.h", "C:\Users\micro\Downloads\f32\mnist-mlp-3layers-0frozen-pretrained-crossentropy-adam\aifes_f32_weights.h"], is_skip_copy_sources = False)

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../../aifes_stm32_pack (3)", files=["Middlewares"], dest_dir_in_cmp = "src", is_skip_copy_sources = False)

platform = client.get_component(name="AIfES_Platform")
status = platform.build()

comp = client.get_component(name="AIfES_component")
comp.build()

comp = client.get_component(name="AIfES_component")
comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["..", "C:/Users/micro/Downloads/ASCON_co_18_09.xpr/AIFES_1/Middlewares"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["..", "../../Middlewares", "C:/Users/micro/Downloads/ASCON_co_18_09.xpr/AIFES_1/AIfES_component/src"])

status = platform.build()

comp = client.get_component(name="AIfES_component")
comp.build()

comp = client.get_component(name="AIfES_component")
comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["..", "."])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = [".."])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["..", "C:/Users/micro/Downloads/ASCON_co_18_09.xpr/AIFES_1/AIfES_component/src/Middlewares/AIfES"])

status = platform.build()

comp = client.get_component(name="AIfES_component")
comp.build()

status = comp.clean()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

comp = client.get_component(name="AIfES_component")
comp.set_app_config(key = "USER_LINK_LIBRARIES", values = ["m"])

comp = client.get_component(name="AIfES_component")
status = comp.clean()

status = platform.build()

comp.build()

