# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.glad.Debug:
/Users/rickidicristoforo/Desktop/capstone-2d/build/Debug/libglad.a:
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/Debug/libglad.a


PostBuild.model_viewer.Debug:
PostBuild.glfw.Debug: /Users/rickidicristoforo/Desktop/capstone-2d/build/Debug/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glad.Debug: /Users/rickidicristoforo/Desktop/capstone-2d/build/Debug/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glfw.Debug: /Users/rickidicristoforo/Desktop/capstone-2d/build/Debug/model_viewer.app/Contents/MacOS/model_viewer
/Users/rickidicristoforo/Desktop/capstone-2d/build/Debug/model_viewer.app/Contents/MacOS/model_viewer:\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Debug/libglfw3.a\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/Debug/libglad.a\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Debug/libglfw3.a
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/Debug/model_viewer.app/Contents/MacOS/model_viewer


PostBuild.glfw.Debug:
/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Debug/libglfw3.a:
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Debug/libglfw3.a


PostBuild.glad.Release:
/Users/rickidicristoforo/Desktop/capstone-2d/build/Release/libglad.a:
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/Release/libglad.a


PostBuild.model_viewer.Release:
PostBuild.glfw.Release: /Users/rickidicristoforo/Desktop/capstone-2d/build/Release/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glad.Release: /Users/rickidicristoforo/Desktop/capstone-2d/build/Release/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glfw.Release: /Users/rickidicristoforo/Desktop/capstone-2d/build/Release/model_viewer.app/Contents/MacOS/model_viewer
/Users/rickidicristoforo/Desktop/capstone-2d/build/Release/model_viewer.app/Contents/MacOS/model_viewer:\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Release/libglfw3.a\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/Release/libglad.a\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Release/libglfw3.a
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/Release/model_viewer.app/Contents/MacOS/model_viewer


PostBuild.glfw.Release:
/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Release/libglfw3.a:
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Release/libglfw3.a


PostBuild.glad.MinSizeRel:
/Users/rickidicristoforo/Desktop/capstone-2d/build/MinSizeRel/libglad.a:
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/MinSizeRel/libglad.a


PostBuild.model_viewer.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/rickidicristoforo/Desktop/capstone-2d/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glad.MinSizeRel: /Users/rickidicristoforo/Desktop/capstone-2d/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glfw.MinSizeRel: /Users/rickidicristoforo/Desktop/capstone-2d/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer
/Users/rickidicristoforo/Desktop/capstone-2d/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer:\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/MinSizeRel/libglfw3.a\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/MinSizeRel/libglad.a\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/MinSizeRel/libglfw3.a
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer


PostBuild.glfw.MinSizeRel:
/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/MinSizeRel/libglfw3.a:
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/MinSizeRel/libglfw3.a


PostBuild.glad.RelWithDebInfo:
/Users/rickidicristoforo/Desktop/capstone-2d/build/RelWithDebInfo/libglad.a:
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/RelWithDebInfo/libglad.a


PostBuild.model_viewer.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/rickidicristoforo/Desktop/capstone-2d/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glad.RelWithDebInfo: /Users/rickidicristoforo/Desktop/capstone-2d/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glfw.RelWithDebInfo: /Users/rickidicristoforo/Desktop/capstone-2d/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer
/Users/rickidicristoforo/Desktop/capstone-2d/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer:\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/RelWithDebInfo/libglad.a\
	/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer


PostBuild.glfw.RelWithDebInfo:
/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a:
	/bin/rm -f /Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a




# For each target create a dummy ruleso the target does not have to exist
/Users/rickidicristoforo/Desktop/capstone-2d/build/Debug/libglad.a:
/Users/rickidicristoforo/Desktop/capstone-2d/build/MinSizeRel/libglad.a:
/Users/rickidicristoforo/Desktop/capstone-2d/build/RelWithDebInfo/libglad.a:
/Users/rickidicristoforo/Desktop/capstone-2d/build/Release/libglad.a:
/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Debug/libglfw3.a:
/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/MinSizeRel/libglfw3.a:
/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a:
/Users/rickidicristoforo/Desktop/capstone-2d/build/glfw-3.2/src/Release/libglfw3.a:
