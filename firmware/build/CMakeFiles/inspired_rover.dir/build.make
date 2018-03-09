# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/autolab/lk_projects/inspired_rover/firmware

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/autolab/lk_projects/inspired_rover/firmware/build

# Include any dependencies generated for this target.
include CMakeFiles/inspired_rover.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/inspired_rover.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/inspired_rover.dir/flags.make

CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj: CMakeFiles/inspired_rover.dir/flags.make
CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj: ../inspired_rover.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/autolab/lk_projects/inspired_rover/firmware/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj"
	/usr/bin/avr-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj -c /home/autolab/lk_projects/inspired_rover/firmware/inspired_rover.cpp

CMakeFiles/inspired_rover.dir/inspired_rover.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/inspired_rover.dir/inspired_rover.cpp.i"
	/usr/bin/avr-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/autolab/lk_projects/inspired_rover/firmware/inspired_rover.cpp > CMakeFiles/inspired_rover.dir/inspired_rover.cpp.i

CMakeFiles/inspired_rover.dir/inspired_rover.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/inspired_rover.dir/inspired_rover.cpp.s"
	/usr/bin/avr-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/autolab/lk_projects/inspired_rover/firmware/inspired_rover.cpp -o CMakeFiles/inspired_rover.dir/inspired_rover.cpp.s

CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj.requires:
.PHONY : CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj.requires

CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj.provides: CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj.requires
	$(MAKE) -f CMakeFiles/inspired_rover.dir/build.make CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj.provides.build
.PHONY : CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj.provides

CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj.provides.build: CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj

# Object files for target inspired_rover
inspired_rover_OBJECTS = \
"CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj"

# External object files for target inspired_rover
inspired_rover_EXTERNAL_OBJECTS =

inspired_rover.elf: CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj
inspired_rover.elf: CMakeFiles/inspired_rover.dir/build.make
inspired_rover.elf: libleonardo_PID_v1.a
inspired_rover.elf: libleonardo_Thread.a
inspired_rover.elf: libleonardo_CORE.a
inspired_rover.elf: CMakeFiles/inspired_rover.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable inspired_rover.elf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/inspired_rover.dir/link.txt --verbose=$(VERBOSE)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating EEP image"
	/usr/bin/avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 /home/autolab/lk_projects/inspired_rover/firmware/build/inspired_rover.elf /home/autolab/lk_projects/inspired_rover/firmware/build/inspired_rover.eep
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating HEX image"
	/usr/bin/avr-objcopy -O ihex -R .eeprom /home/autolab/lk_projects/inspired_rover/firmware/build/inspired_rover.elf /home/autolab/lk_projects/inspired_rover/firmware/build/inspired_rover.hex
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Calculating image size"
	/usr/bin/cmake -DFIRMWARE_IMAGE=/home/autolab/lk_projects/inspired_rover/firmware/build/inspired_rover.elf -DMCU=atmega32u4 -DEEPROM_IMAGE=/home/autolab/lk_projects/inspired_rover/firmware/build/inspired_rover.eep -P /home/autolab/lk_projects/inspired_rover/firmware/build/CMakeFiles/FirmwareSize.cmake

# Rule to build all files generated by this target.
CMakeFiles/inspired_rover.dir/build: inspired_rover.elf
.PHONY : CMakeFiles/inspired_rover.dir/build

CMakeFiles/inspired_rover.dir/requires: CMakeFiles/inspired_rover.dir/inspired_rover.cpp.obj.requires
.PHONY : CMakeFiles/inspired_rover.dir/requires

CMakeFiles/inspired_rover.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/inspired_rover.dir/cmake_clean.cmake
.PHONY : CMakeFiles/inspired_rover.dir/clean

CMakeFiles/inspired_rover.dir/depend:
	cd /home/autolab/lk_projects/inspired_rover/firmware/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/autolab/lk_projects/inspired_rover/firmware /home/autolab/lk_projects/inspired_rover/firmware /home/autolab/lk_projects/inspired_rover/firmware/build /home/autolab/lk_projects/inspired_rover/firmware/build /home/autolab/lk_projects/inspired_rover/firmware/build/CMakeFiles/inspired_rover.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/inspired_rover.dir/depend

