# Camera connection of Raspberry Pi (Sensor IMX219, V2.1) with Nvidia Jetson TX2

## Introduction

In this guide we will explain all the steps followed for the correct generation of the necessary files in the connection of the ** IMX219 sensor **. For this purpose first, we will define the steps to follow in the development for the implementation of the camera modules. All the resources we have used to develop this guide are at the end of it.

## Preparation of necessary elements (Hardware / Software)

Before starting the development it is necessary to have a series of basic elements of both software and hardware. We will start with the necessary hardware items and continue listing the software items.

### Hardware

The first thing we will need will be the [Nvidia Jetson TX2] development kit (https://www.nvidia.es/autonomous-machines/embedded-systems-dev-kits-modules/). On the other hand, we will need a device that allows us to connect the cameras to the Jetson TX2, in our case we have opted for the connector [J20 of Auvidea] (https://auvidea.com/j20/). Finally, we will need the camera modules that we will implement in our board. In this case we have two options if we talk about modules compatible with Raspberry Pi. We can opt for [version 2.1] (https://www.raspberrypi.org/products/camera-module-v2/) or for [version 1.3] (https://uk.pi-supply.com/products/ raspberry-pi-camera-board-v1-3-5mp-1080p). We will choose to implement the most updated version of this sensor, this is version 2.1.

- OV5647 sensor (Rpi camera version 1.3)

<p align = "center">
  <img width = "150" src = "https://www.dexterindustries.com/wp-content/uploads/2015/07/Raspberry-Pi-Camera.jpg">
</p>
     
- IMX219 sensor (Version 2.1 of Rpi camera)

<p align = "center">
  <img width = "150" src = "http://img.dxcdn.com/productimages/sku_433744_1.jpg">
</p>

### Software

With respect to the software necessary for the implementation of this tool, we will need the following:

- [Ubuntu 16.04 LTS] (http://releases.ubuntu.com/16.04/), for programming and loading the new kernel in the NVDIA Jetson (for both TX1 and TX2) it is necessary to have this system operational This is because the SDK developed by NVIDIA for loading the code is specifically developed for this system.
- [SDK Jetson TX1 / TX2] (https://developer.nvidia.com/embedded/jetpack), the NVIDIA Jetpack provides us with the necessary tools for downloading and modifying the NVIDIA Jetson source code. On the other hand, it will also install tools such as TensorFlow or examples for rendering with CUDA that could later be implemented in the development kit.
- [Linaro ToolChain] (http://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/), this tool will help us compile the NVIDIA Jetson kernel into our system and then load it onto the board.

## Sensor implementation at Software level

Before we begin, we must determine which are the steps that we must execute for the correct implementation of the code in the platform:

1. Prepare the source files of the * Device Tree *
2. Modify the files of the * Device Tree * correctly.
3. Modify the source files of the camera module.
4. Configure the Kernel to detect the modules that we have added.
5. Compile the kernel.
6. Load the kernel into the NVIDIA Jetson TX2.
7. Load the ** DTB ** in the Jetson TX2.
8. Test the correct functioning of the system.

Once we have defined the steps to follow, we can introduce each of them with a greater level of detail.

### Preparation of source files of * Device Tree *

In general, on Linux systems, there are two ways to modify the kernel. The two methods are as follows:

- Through the ** Kernel configuration file **: this will tell the kernel what features and drivers should be compiled. You can also specify which drivers should be packaged in the kernel and which drivers should be compiled but separated from the kernel. In our case, we will modify this to tell the kernel to create compatibility with the IMX219 controller.

- Using the ** Device Tree Source (DTS) **: this is how you can configure the kernel at boot to behave differently on one board versus another. A clear example can be found with the Raspberry Pi and the Raspberry Pi Zero. These two boards are very different to the naked eye but they have the same kernel because there are two different DTS files for it.



As we have commented, we need to add support for the IMX219 camera (Raspberry Pi Model 2.1 Camera). Because there is no mechanism to recognize CSI cameras while the kernel is running, we have to modify the ** DTS ** to tell the kernel how to recognize them. This is very different with respect to the operation of a USB, for example, because in the case of USB there is a standard mechanism that the kernel can use to recognize when a new device is inserted, for the CSI this is not so. Therefore, each board is configured with an internal file known as ** DTB (Device Tree Binary) **. This ** DTB ** is a compiled version of the ** DTS (Device Tree Source) ** and ** DTSi (Device Tree Source Include) ** files.

We need to configure the DTS file to recognize the IMX219 camera, to do this we have to describe the following:

- To which CSI ports the cameras are connected.
- How the cameras should be configured using I2C.
- What display modes do the cameras have (Do you have 1920x1080 and / or 1280x720).
- How to configure the video input architecture of TX2.

All this must be collected in a ** DTS ** file. We can use this file from scratch, but for the vast majority of cases the default ** DTS ** file used for NVIDIA development kits can be used. In case you want to gain more control over this procedure you can consult the following [link] (https://cospandesign.github.io/linux/2017/10/27/tx2-bringup.html). In our case, we will choose to create our ** DTS ** file based on the codes created by NVIDIA. The default route to locate the default configuration file on the Jetson TX2 is:

``
Linux_for_Tegra / sources / hardware / nvidia / platform / t18x / quill / kernel-dts / tegra186-quill-p3310-1000-c03-00-base.dts
``
In the previous route we can find some information although really, much of the configuration is in this other route:

``
Linux_for_Tegra / sources / hardware / nvidia / platform / t18x / quill / kernel-dts / tegra186-quill-p3310-1000-a00-00-base.dts
``

Before continuing, it is likely that you still do not have the files we have mentioned so it will be necessary to download them. In the next section we will explain how to perform this process correctly.

### Download NVIDIA JetPack 3.2 and kernel source files
#### Download NVIDIA JetPack

1. Download version 3.2 (or the most recent version) from the following [link] (https://developer.nvidia.com/embedded/dlc/jetpack-l4t-3_2-ga).
2. Move the binary files you just downloaded to a directory where you want the installation to occur. The recommended route would be `/ home / $ USER / JetPack-L4T-3.2`. In this case, the commands to be entered in the terminal would be the following:

``
mkdir -p /home/$USER/JetPack-L4T-3.2
mv JetPack-L4T-3.2-linux-x64_b196.run /home/$USER/JetPack-L4T-3.2/
``

3. Mark the file executable and assign the permissions.

``
cd /home/$USER/JetPack-L4T-3.2
chmod + x JetPack-L4T-3.2-linux-x64_b196.run
``

4. Install the JetPack.

``
./JetPack-L4T-3.2-linux-x64_b196.run
``

5. Follow the instructions for installation. Select the board in the installer (TX1, TX2, TX2i).

#### Download kernel source files

To download all the necessary files we will call `$ DEVDIR` to the directory where the development files are located. In the case of having used the commands previously introduced we would have:

- ** For TX1 **
``
export DEVDIR = $ HOME / JetPack-L4T-3.2 / 64_TX1 / Linux_for_Tegra
``
- ** For TX2 **
``
export DEVDIR = $ HOME / JetPack-L4T-3.2 / 64_TX2 / Linux_for_Tegra
``

To download all source files, we will use the script * source_sync.sh *

``
cd $ DEVDIR /
./source_sync.sh
``

This command will also download the bootloader and kernel. When the script asks for the tag we want to synchronize, enter ** tegra-l4t-r28.2 ** in both cases.

### Modification of source files of * Device Tree *

Once we have downloaded the source files, we will modify the available file in the following path:

``
Linux_for_Tegra / sources / hardware / nvidia / platform / t18x / quill / kernel-dts / tegra186-quill-p3310-1000-a00-00-base.dts
``

To simplify development, intelligent support for NVIDIA camera management will be disabled and references to other camera modules will be removed. The file would look like this:

``
#include <t18x-common-platforms / tegra186-quill-common-p3310-1000-a00.dtsi>
#include <t18x-common-platforms / tegra186-quill-power-tree-p3310-1000-a00-00.dtsi>
// # include <t18x-common-platforms / tegra186-quill-camera-modules.dtsi>
#include <t18x-common-modules / tegra186-display-e3320-1000-a00.dtsi>

/ * comms dtsi file should be included after gpio dtsi file * /
#include <t18x-common-platforms / tegra186-quill-comms.dtsi>
#include <t18x-common-plugin-manager / tegra186-quill-p3310-1000-a00-plugin-manager.dtsi>
#include <t18x-common-modules / tegra186-super-module-e2614-p2597-1000-a00.dtsi>
#include <t18x-common-plugin-manager / tegra186-quill-display-plugin-manager.dtsi>
#include <t18x-common-prod / tegra186-priv-quill-p3310-1000-a00-prod.dtsi>
// # include <t18x-common-plugin-manager / tegra186-quill-camera-plugin-manager.dtsi>

#include <dt-bindings / linux / driver-info.h>
``

Now that we have removed all references to the previous cameras, let's add two files. One that will configure the board level camera (s) and the other to configure the internal architecture of the Jetson TX2 Video Interface.

To do this, we will create a new file called * tegra186-my-camera-config-a00.dtsi * in the following directory:
``
Linux_for_Tegra / sources / hardware / nvidia / platform / t18x / common / kernel-dts / t18x-common-platforms /
``
We will create a second file with the same name in this other directory:
``
Linux_for_Tegra / sources / hardware / nvidia / platform / t18x / common / kernel-dts / t18x-common-modules /
``

The * my-camera-config * file can be changed to whatever you want and * a00 * is only the first version of this file.

For now, we will use the version hosted on * platforms * of the file as a step for the module, but technically you can override the abstract * modules * provided for some general platform.

Within the * platforms * version of the file, we include the following line:
``
#include <t18x-common-modules / tegra186-my-camera-config-a00.dtsi>

``

Within the configuration file we need to configure a series of parameters so that the camera is able to function. The modules are as follows:

* Allow the GPIOs of the Jetson TX2 to have the following functionalities:
    * Reset the lines
    * Possible incorporation of an I2C address multiplexer
* TX2’s host1x
    * NVCSI component: This component will be used to configure the CSI lines to communicate with the cameras correctly.
    * Component VI: Configures the NVCSI output directly to the ISP lines or directly over the device memory.
    * Component I2C: Configuration of the camera output to video.
* GPIOs
    * Configure GPIOs to have certain behavior such as resetting the camera, turning it on or off its regulators.
* * Tegra-camera-platform *
    * Describe the physical location of the camera.
    * Configure the ISP to process the images.
    * Describe other elements that the camera may need, such as the focus.

To better understand all of the above, the main idea has been illustrated in the following image:

<p align = "center">
  <img width = "800" src = "http://cospandesign.github.io/assets/image/posts/rpi-camera/rpi_video_subsystem.png">
</p>

All Raspberry Pi cameras have the same I2C address, so we need a way to distinguish one camera from another. The easiest way is with a multiplexer. For this reason, we will use a GPIO multiplexer since the controller for it is already integrated in the kernel.

At a high level if we look at the previous figure, the data from the Raspberry Pi cameras reach the Jetson TX2 through the CSI channels represented in blue. We only need a two-channel CSI bus in this case so we take CSI A, if we need four channels, we would reserve two blocks. The ** NVCSI ** kernel will extract the raw image from the CSI protocol and send the data to ** VI **. This component * Video Input * is essentially a video router, routes the video to the ISP or directly to the device memory. If the Raspberry Pi camera has an internal image signal processor to convert the image to a useful RGB image, we will tell the VI to route the image data to memory, but since the camera does not have an ISP, we use the ISP that owns the Jetson TX2. The process of routing the video data after the ** VI ** component is done within the territory of the user when the kernel starts, so we finish once the ** VI ** is connected correctly and the user already has data access

Once all this is understood, we will download the following files:

- [module tegra186-my-config-a00.dtsi] (http://cospandesign.github.io/assets/files/posts/rpi-camera/tegra186-my-config-camera-a00_MODULE.dtsi)
- [platform tegra186-my-config-a00.dtsi] (http://cospandesign.github.io/assets/files/posts/rpi-camera/tegra186-my-config-camera-a00_PLATFORM.dtsi)

The directories to save these files would be the following:

``
Linux_for_Tegra / sources / hardware / nvidia / platform / t18x / common / kernel-dts / t18x-common-modules /
``
``
Linux_for_Tegra / sources / hardware / nvidia / platform / t18x / common / kernel-dts / t18x-common-platforms /
``
Finally, it is necessary to include the file `tegra186-my-camera-config-a00.dtsi` in the header of our file ** dts ** of base system configuration. Inside the file `tegra186-quill-p3310-1000-c03-00-base.dts` we must add the following line:

``
#include <t18x-common-platforms / tegra186-my-camera-config-a00.dtsi>
``

It should look like this:

``
#include "tegra186-quill-p3310-1000-a00-00-base.dts"
#include <t18x-common-platforms / tegra186-my-camera-config-a00.dtsi>

/ {
  nvidia, dtsfilename = __FILE__;
  nvidia, dtbbuildtime = __DATE__, __TIME__;
  ...
``

Once this is done we can proceed to make the modifications on the camera modules.

### Modification of camera module source files

Unfortunately, the driver for the ** IMX219 ** sensor supplied by NVIDIA is not compatible with the Raspberry Pi module. Therefore, it is necessary to make some minor modifications. Among other things, the requirements of the regulator must be eliminated and the mode tables must be modified. To make this modification simply download the following files:

- [imx219.c] (http://cospandesign.github.io/assets/files/posts/rpi-camera/imx219.c)
- [imx219_mode_tbls.h] (http://cospandesign.github.io/assets/files/posts/rpi-camera/imx219_mode_tbls.h)

Overwrite the existing files in the following directory with those previously downloaded:

``
Linux_for_Tegra / sources / kernel / kernel-4.4 / drivers / media / i2c
``

### Kernel configuration to detect the added modules

Once downloaded and installed [toolchain] (http://developer.ridgerun.com/wiki/index.php?title=Compiling_Tegra_X1/X2_source_code#Toolchain) we can prepare the Kernel for compilation. During the preparation, we will configure the files that we want to compile and among them we will add the files that we have modified and the modules that we need for the correct functioning of the cameras.

The first step will be to configure the environment that we are going to use, by entering the following commands:

``
mkdir -p $ DEVDIR / images / modules
mkdir -p $ DEVDIR / images / packages
export CROSS_COMPILE = / opt / linaro / gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu / bin / aarch64-linux-gnu-
export CROSS32CC = / opt / linaro / gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf / bin / arm-linux-gnueabihf-gcc
export KERNEL_MODULES_OUT = $ DEVDIR / images / modules
export TEGRA_KERNEL_OUT = $ DEVDIR / images
export ARCH = arm64
``

We clean the previous kernel configuration:

``
cd $ DEVDIR / sources / kernel / kernel-4.4
make mrproper
``

We configure the kernel:

``
make O = $ TEGRA_KERNEL_OUT tegra18_defconfig
make O = $ TEGRA_KERNEL_OUT menuconfig
``

** IMPORTANT **: To execute the previous step, you may need to install the following packages if you get an error when executing it.

``
sudo apt-get install libncurses5 libncurses5-dev
``

When executing the command `make O = $ TEGRA_KERNEL_OUT menuconfig` a menu will appear in which we can configure the modules that we want to load for compilation in the kernel. The window that will appear in our terminal will be the same as we see in the following image:

<p align = "center">
  <img width = "600" src = "http://cospandesign.github.io/assets/image/posts/rpi-camera/kernel-menu-config.png">
</p>

Within this menu we must look for a module called * i2c-gpio-mux *. To do this, press `/` to open the search engine and then write `I2C_MUX_GPIO`, press ** enter ** and the following should appear:

<p align = "center">
  <img width = "600" src = "http://cospandesign.github.io/assets/image/posts/rpi-camera/kernel-menu-config-i2c-mux-gpio.png">
</p>

Press the * 1 * key until a new menu appears and then the * and * key so that a * appears in the selection as follows:

<p align = "center">
  <img width = "600" src = "http://cospandesign.github.io/assets/image/posts/rpi-camera/select-i2c-mux-gpio.png">
</p>

We will do the same to find the IMX219 camera module. Once this is done, we will use the arrow keys to save the configuration. The file must have the default name, that is, `.config`. Configured the Kernel we can go to its compilation.
### Compilation of kernel and DTB

Once the previous steps have been completed, we can compile the kernel of our system.

``
make O = $ TEGRA_KERNEL_OUT zImage
make O = $ TEGRA_KERNEL_OUT dtbs
make O = $ TEGRA_KERNEL_OUT modules
make O = $ TEGRA_KERNEL_OUT modules_install INSTALL_MOD_PATH = $ KERNEL_MODULES_OUT
``
After this, the kernel image we have compiled would be in the following path:

``
$ DEVDIR / images / arch / arm64 / boot / Image
``

And the * devicetree * would be found in:
``
$ DEVDIR / images / arch / arm64 / boot / dts / *. Dtb
``

The next step would be to create a file that we will call * kernel_supplements.tbz2 * and that will contain the kernel modules that we have compiled. This file is one of the requirements that ** Jetpack ** has.

``
cd $ DEVDIR / images / modules / lib / modules /
ls.
``
We will define a variable with the same name that appears when entering the previous command:

``
export KERNEL_MODULES_NAME = 4.4.38 +
``
We repair the symbolic links found in the kernel module directory:

``
cd $ DEVDIR / images / modules / lib / modules / $ KERNEL_MODULES_NAME
rm build source
``

We create a * tarball *:

``
cd $ DEVDIR / images / modules /
tar -cjf kernel_supplements.tbz2 *
mv kernel_supplements.tbz2 $ DEVDIR / images / packages
``
In addition to creating the modules and the kernel image, we need to re-create your * kernel_headers.tbz2 * file (required for Jetpack). By default, when a patch is applied to the kernel code and your changes in the kernel are not verified, a suffix -dirty will be added to the release version (check `ls $ DEVDIR / images / modules / lib / modules /` for example). For this specific reason we need to generate their * tarball * headers again by changing the release version.

``
cd $ DEVDIR / kernel
tar -xf kernel_headers.tbz2
``
We look for the name of the folder that contains the * headers *, in our case it is * linux-headers-4.4.38-tegra *:

``
ls | grep linux-headers
linux-headers-4.4.38-tegra
export KERNEL_HEADERS_NAME = linux-headers-4.4.38-tegra
``

Rename the folder:

``
mv $ KERNEL_HEADERS_NAME linux-headers- $ KERNEL_MODULES_NAME
tar -cjf kernel_headers_custom.tbz2 linux-headers- $ KERNEL_MODULES_NAME
mv kernel_headers_custom.tbz2 $ DEVDIR / images / packages
rm -rf linux-headers- $ KERNEL_MODULES_NAME
``

We create a secure copy of the image and packages included in the JetPack:

``
mkdir -p $ DEVDIR / images / packages-backup
cp -rf $ DEVDIR / kernel / * $ DEVDIR / images / packages-backup
``

We copy the DTB file:
``
cp $ DEVDIR / images / arch / arm64 / boot / dts / tegra186-quill-p3310-1000-c03-00-base.dtb $ DEVDIR / kernel / dtb
``
The final step is to overwrite the default images with the image we generated during compilation to install them using JetPack.

``
cd $ DEVDIR / images
cp -rf arch / arm64 / boot / Image arch / arm64 / boot / zImage packages / kernel_supplements.tbz2 $ DEVDIR / kernel /
cp -rf packages / kernel_headers_custom.tbz2 $ DEVDIR / kernel / kernel_headers.tbz2
``

We execute the script * apply_binaries.sh * to generate the image to be loaded in the Jetson TX2.

``
cd $ DEVDIR /
sudo ./apply_binaries.sh
``
### Kernel loading on the Nvidia Jetson TX2

1. We make a backup copy of our system image

``
cd $ DEVDIR / bootloader /
mv system.img.raw system.img $ DEVDIR / images / packages-backup /
``

2. We run the Jetpack just like the first time we installed it on our system:

``
cd $ DEVDIR /../../
JetPack-L4T-3.2-linux-x64_b196.run
``

JetPack will realize that everything is already built and will install its new images on the Jetson TX2. If you have trouble detecting the IP address wait about 2 minutes and it will give you the option to enter it manually.

### Load the DTBs in the Jetson TX2

In earlier versions of JetPack, updating the DTB was as easy as replacing the boot folder in the home directory and could also change the FDT entry in `/ boot / extlinux / extlinux.conf` to use a different one. For ** Jetpack 3.1 ** this was modified and a separate partition is used to update the ** DTB ** file and Nvidia says it can only be updated by displaying it again using the provided flash script.

``
$ DEVDIR / images / arch / arm64 / boot / dts / *. Dtb
``
We replace the DTB in `$ DEVDIR / kernel / dtb``with which we have generated. It is advisable to make a backup copy of the original DTB.

``
cp $ DEVDIR / images / arch / arm64 / boot / dts / tegra186-quill-p3310-1000-c03-00-base.dtb $ DEVDIR / kernel / dtb
``

We put the board in * recovery_USB * mode and load the image:

``
cd $ DEVDIR
sudo ./flash.sh -r -k kernel-dtb jetson-tx2 mmcblk1p1
``
** IMPORTANT **: Use mmcblk1p1 for an SDcard and mmcblk0p1 for emmc.

There is another way to do it directly from the board, but this method usually causes errors:
``
sudo dd if = tegra186-quill-p3310-1000-c03-00-base.dtb of = / dev / mmcblk0p13
``

### Function test

After everything is built and loaded in the Jetson. They should appear to have three new `/ dev / videoX` entries.

The following command can be used to capture a short video:

``
gst-launch-1.0 -v nvcamerasrc sensor-id = 0 fpsRange = "30 30" num-buffers = 100! 'video / x-raw (memory: NVMM), width = (int) 1920, height = (int) 1080, format = (string) I420, framerate = (fraction) 30/1'! omxh264enc! 'video / x-h264, width = (int) 1920, height = (int) 1080, format = (string) I420, framerate = (fraction) 30/1'! h264 stand up! qtmux! filesink location = test.mp4 -e
``

As it is running at 30 FPS and captures 100 frames, the clip will last 2.33 seconds. You can play with these values ​​to modify it. You can also switch between different sensors with the value ** sensor id **.

** NOTE **: You may need to update the image configuration cache of your ISP to ask the kernel to rebuild the ISP configuration for your specific camera. The cache is located in:
``
/ var / nvidia / nvcam / settings
``
Delete all these files and restart TX2 and they should be rebuilt. This value depends on the * tegra-camera-platform * configuration.
## Means

Next we will list the resources that have been consulted for the development of this guide in which it is intended to illustrate the entire procedure followed for the kernel modification, its compilation and its subsequent implementation in the NVIDIA Jetson.

- [Raspberry Pi camera on TX2] (http://cospandesign.github.io/linux,tx2,kernel,driver/2017/12/15/tx2-rpi-camera-port.html) - Guide for the connection of three Raspberry modules.
- [Development of a Kernel module] (http://cospandesign.github.io/linux,kernel,driver/2016/04/15/kernel-driver.html) - Basic guide for the development of a Kernel module.
- [Porting NVIDIA TX2 to a new platform] (https://cospandesign.github.io/linux/2017/10/27/tx2-bringup.html) - Code portability between the Jetson TX2 and other platforms.
- [Development User Guide] (https://developer.nvidia.com/embedded/dlc/l4t-documentation-28-1) - Guide for code development for the Jetson TX2 platform.
- [Topics in the Nvidia Forum] (https://devtalk.nvidia.com/default/topic/1009359/jetson-tx2/jetson-tx1-sensor-driver-porting-to-tx2-4-4-kernel- /) - Thread from the NVIDIA developer forum where the development of camera modules is concerned.
- [TX1 source code] (https://github.com/CospanDesign/nvidia-tx1-kernel) - NVIDIA Jetson TX1 source code.
- [Wiki on the Kernel TX1 compilation] (http://developer.ridgerun.com/wiki/index.php?title=Compiling_Tegra_X1/X2_source_code#Build_Kernel) Guide to the kernel compilation of the NVIDIA Jetson TX1.
- [Linux Kernel Compilation Documentation] (https://www.kernel.org/doc/Documentation/kbuild/modules.txt) - Web with documentation on the Linux Kernel compilation.
- [Wiki on the Kernel TX2 compilation] (http://developer.ridgerun.com/wiki/index.php?title=Compiling_Tegra_X2_source_code) Guide to the kernel compilation of the NVIDIA Jetson TX2.
- [Kernel patch application] (https://www.kernel.org/doc/html/v4.11/process/applying-patches.html) Guide for patching the Linux kernel.
- [Add IMX219 sensor to TX1] (https://developer.ridgerun.com/wiki/index.php?title=Sony_IMX219_Linux_driver_for_Tegra_X1) Guide to add and compile the source code of the OV5647 sensor in the NVIDIA Jetson TX1.
- [J20 Connector Guide] (http://developer.ridgerun.com/wiki/index.php?title=Getting_started_guide_for_Auvidea_J20_board) Wiki about the J20 connector developed by Auvidea for the use of different cameras on the NVIDIA Jetson TX1 / TX2.
