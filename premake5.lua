project "GLFW"
kind "StaticLib"
    language "C"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("obj/" .. outputdir .. "/%{prj.name}")

    files {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/context.c",
        "src/egl_context.c",
        "src/glfw_config.h",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/osmesa_context.c",
        "src/vulkan.c",
        "src/window.c"
    }

    -- Windows
    filter "system:windows"
        systemversion "latest"

        files {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_thread.c",
            "src/win32_time.c",
            "src/win32_window.c",
            "src/wgl_context.c",
        }

        defines {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

        links { "Dwmapi.lib" }

    -- Linux
    filter "system:linux"
        systemversion "latest"

        files {
            "src/glx_context.c",
            "src/linux_joystick.c",
            "src/null_init.c",
            "src/null_joystick.c",
            "src/null_monitor.c",
            "src/null_window.c",
            "src/platform.c",
            "src/posix_module.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c"
        }

        defines { "_GLFW_X11" }

    -- Debug
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    -- Release
    filter "configurations:Release"
        runtime "Release"
        optimize "on"