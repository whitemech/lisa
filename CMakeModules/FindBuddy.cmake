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

# Try to find Buddy headers and libraries.
#
# Usage of this module as follows:
#
# find_package(Buddy)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
# BUDDY_ROOT Set this variable to the root installation of
# libmona if the module has problems finding the
# proper installation path.
#
# Variables defined by this module:
#
# BUDDY_FOUND System has BUDDY libraries and headers
# BUDDY_LIBRARIES The BUDDY library
# BUDDY_INCLUDE_DIRS The location of BUDDY headers

# Get hint from environment variable (if any)
if(NOT BUDDY_ROOT AND DEFINED ENV{BUDDY_ROOT})
	set(BUDDY_ROOT "$ENV{BUDDY_ROOT}" CACHE PATH "BUDDY base directory location (optional, used for nonstandard installation paths)")
	mark_as_advanced(BUDDY_ROOT)
else()
	set(BUDDY_ROOT "/usr/local")
endif()

# Search path for nonstandard locations
if(BUDDY_ROOT)
	set(BUDDY_INCLUDE_PATH PATHS "${BUDDY_ROOT}/include" NO_DEFAULT_PATH)
	set(BUDDY_LIBRARY_PATH PATHS "${BUDDY_ROOT}/lib" NO_DEFAULT_PATH)
endif()

find_path(BUDDY_INCLUDE_DIRS NAMES bddx.h HINTS ${BUDDY_INCLUDE_PATH})
find_library(BUDDY_LIBRARY NAMES bddx)
set(BUDDY_LIBRARIES  ${BUDDY_LIBRARY})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(Buddy DEFAULT_MSG BUDDY_LIBRARIES BUDDY_INCLUDE_DIRS)

mark_as_advanced(BUDDY_ROOT BUDDY_LIBRARIES BUDDY_INCLUDE_DIRS)
