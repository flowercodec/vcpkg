vcpkg_download_distfile(ARCHIVE
    URLS "https://sourceforge.net/projects/opencore-amr/files/vo-amrwbenc/vo-amrwbenc-0.1.3.tar.gz"
    FILENAME vo-amrwbenc-0.1.3.tar.gz
    SHA512 5f132f798f00ec2c0619700ab1ce456897792b45631af4b538c866636af9c9de5600af5f79040c41c3dc69c17cf4be7032139a9518a46a4276431e091f3dd6a9
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