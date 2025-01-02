vcpkg_download_distfile(ARCHIVE
    URLS "https://sourceforge.net/projects/opencore-amr/files/opencore-amr/opencore-amr-0.1.6.tar.gz"
    FILENAME opencore-amr-0.1.6.tar.gz
    SHA512 8955169954b09d2d5e2190888602c75771b72455290db131ab7f40b587df32ea6a60f205126b09193b90064d0fd82b7d678032e2b4c684189788e175b83d0aa7
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

vcpkg_make_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS_RELEASE
        --enable-strip
    OPTIONS_DEBUG
        --enable-debug
)

vcpkg_make_install()

vcpkg_fixup_pkgconfig()

vcpkg_copy_pdbs()