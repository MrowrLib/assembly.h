set_languages("c++23")
add_rules("mode.debug")
set_toolchains("msvc")

add_repositories("MrowrLib https://github.com/MrowrLib/package-repo.git")
add_repositories("ModdingFramework https://github.com/ModdingFramework/package-repo.git")

add_requires("zydis")
add_requires("xbyak")
add_requires("spdlog")
add_requires("StringFormatting")
add_requires("Memory")

target("Assembly")
    set_kind("headeronly")
    add_headerfiles("include/(**.h)")
    add_includedirs("include", {public = true})
    add_packages("zydis", "xbyak", {public = true})

target("Example")
    set_kind("binary")
    add_files("Example.cpp")
    add_deps("Assembly")
    add_packages("Memory", "StringFormatting", "spdlog")
