#
# This file is part of Lydia.
#
# Lydia is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Lydia is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Lydia.  If not, see <https://www.gnu.org/licenses/>.
#

# Try to find SPOT headers and libraries.
#
# Usage of this module as follows:
#
# find_package(SPOT)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
# SPOT_ROOT Set this variable to the root installation of
# libmona if the module has problems finding the
# proper installation path.
#
# Variables defined by this module:
#
# SPOT_FOUND System has SPOT libraries and headers
# SPOT_LIBRARIES The SPOT library
# SPOT_INCLUDE_DIRS The location of SPOT headers

# Get hint from environment variable (if any)
if(NOT SPOT_ROOT AND DEFINED ENV{SPOT_ROOT})
	set(SPOT_ROOT "$ENV{SPOT_ROOT}" CACHE PATH "SPOT base directory location (optional, used for nonstandard installation paths)")
	mark_as_advanced(SPOT_ROOT)
else()
	set(SPOT_ROOT "/usr/local")
endif()

# Search path for nonstandard locations
if(SPOT_ROOT)
	set(SPOT_INCLUDE_PATH PATHS "${SPOT_ROOT}/include" NO_DEFAULT_PATH)
	set(SPOT_LIBRARY_PATH PATHS "${SPOT_ROOT}/lib" NO_DEFAULT_PATH)
endif()

find_path(SPOT_INCLUDE_DIRS NAMES spot HINTS ${SPOT_INCLUDE_PATH})
find_library(SPOT_LIBRARY NAMES spot)
find_library(SPOT_GEN_LIBRARY NAMES spotgen)
find_library(SPOT_LTSMIN_LIBRARY NAMES spotltsmin)
set(SPOT_LIBRARIES  ${SPOT_LIBRARY}  ${SPOT_GEN_LIBRARY} ${SPOT_LTSMIN_LIBRARY})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(SPOT DEFAULT_MSG SPOT_LIBRARIES SPOT_INCLUDE_DIRS)

mark_as_advanced(SPOT_ROOT SPOT_LIBRARIES SPOT_INCLUDE_DIRS)
