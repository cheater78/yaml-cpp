project "yaml-cpp"
	kind "StaticLib"
	language "C"
	cppdialect "C++20"
	staticruntime "on"
	warnings "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.hpp",
		"src/**.c",
		"src/**.cpp",
		
		"include/**.h",
		"include/**.hpp"
	}
	
	includedirs
	{
		"include"
	}

	filter "system:linux"
		pic "On"

		systemversion "latest"
		
		files
		{
		}

		defines
		{
		}

	filter "system:macosx"
		pic "On"

		files
		{
		}

		defines
		{
		}

	filter "system:windows"
		systemversion "latest"

		files
		{
		}

		defines 
		{ 
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
