#不支持编译，用VS手动编译后，复制到 vcpkg_installed目录

vcpkg_download_distfile(ARCHIVE
    URLS "https://downloads.xvid.com/downloads/xvidcore-1.3.7.zip"
    FILENAME xvidcore-1.3.7.zip
    SHA512 7a1cbbba1d4a45abf3072b1ca8ada76764430638b07fd1c40815d0a751619e4eeb25ed2be3e0368764507a99feb5daa88a882881c838f0fb0f162d57f8c7fd3f
)

vcpkg_extract_source_archive(
    SOURCE_PATH_RAW
    ARCHIVE "${ARCHIVE}"
)

set(SOURCE_PATH ${SOURCE_PATH_RAW}/build/generic)

vcpkg_make_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "CFLAGS=\$CFLAGS -I${SOURCE_PATH_RAW}/src"
    OPTIONS_RELEASE
        --enable-strip
    OPTIONS_DEBUG
        --enable-debug
)

vcpkg_make_install(
    MAKEFILE "${SOURCE_PATH}/Makefile"
    OPTIONS
        "-C ${SOURCE_PATH}"
    OPTIONS_DEBUG
        --enable-debug
)
vcpkg_fixup_pkgconfig()

vcpkg_copy_pdbs()