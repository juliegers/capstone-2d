# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.glad.Debug:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/Debug/libglad.a:
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/Debug/libglad.a


PostBuild.model_viewer.Debug:
PostBuild.glfw.Debug: /Users/juliegerstley/Downloads/Capstone\ 2D/build/Debug/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glad.Debug: /Users/juliegerstley/Downloads/Capstone\ 2D/build/Debug/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glfw.Debug: /Users/juliegerstley/Downloads/Capstone\ 2D/build/Debug/model_viewer.app/Contents/MacOS/model_viewer
/Users/juliegerstley/Downloads/Capstone\ 2D/build/Debug/model_viewer.app/Contents/MacOS/model_viewer:\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Debug/libglfw3.a\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/Debug/libglad.a\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Debug/libglfw3.a
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/Debug/model_viewer.app/Contents/MacOS/model_viewer


PostBuild.glfw.Debug:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Debug/libglfw3.a:
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Debug/libglfw3.a


PostBuild.glad.Release:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/Release/libglad.a:
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/Release/libglad.a


PostBuild.model_viewer.Release:
PostBuild.glfw.Release: /Users/juliegerstley/Downloads/Capstone\ 2D/build/Release/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glad.Release: /Users/juliegerstley/Downloads/Capstone\ 2D/build/Release/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glfw.Release: /Users/juliegerstley/Downloads/Capstone\ 2D/build/Release/model_viewer.app/Contents/MacOS/model_viewer
/Users/juliegerstley/Downloads/Capstone\ 2D/build/Release/model_viewer.app/Contents/MacOS/model_viewer:\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Release/libglfw3.a\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/Release/libglad.a\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Release/libglfw3.a
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/Release/model_viewer.app/Contents/MacOS/model_viewer


PostBuild.glfw.Release:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Release/libglfw3.a:
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Release/libglfw3.a


PostBuild.glad.MinSizeRel:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/MinSizeRel/libglad.a:
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/MinSizeRel/libglad.a


PostBuild.model_viewer.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/juliegerstley/Downloads/Capstone\ 2D/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glad.MinSizeRel: /Users/juliegerstley/Downloads/Capstone\ 2D/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glfw.MinSizeRel: /Users/juliegerstley/Downloads/Capstone\ 2D/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer
/Users/juliegerstley/Downloads/Capstone\ 2D/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer:\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/MinSizeRel/libglfw3.a\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/MinSizeRel/libglad.a\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/MinSizeRel/libglfw3.a
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/MinSizeRel/model_viewer.app/Contents/MacOS/model_viewer


PostBuild.glfw.MinSizeRel:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/MinSizeRel/libglfw3.a:
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/MinSizeRel/libglfw3.a


PostBuild.glad.RelWithDebInfo:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/RelWithDebInfo/libglad.a:
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/RelWithDebInfo/libglad.a


PostBuild.model_viewer.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/juliegerstley/Downloads/Capstone\ 2D/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glad.RelWithDebInfo: /Users/juliegerstley/Downloads/Capstone\ 2D/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer
PostBuild.glfw.RelWithDebInfo: /Users/juliegerstley/Downloads/Capstone\ 2D/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer
/Users/juliegerstley/Downloads/Capstone\ 2D/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer:\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/RelWithDebInfo/libglad.a\
	/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/RelWithDebInfo/model_viewer.app/Contents/MacOS/model_viewer


PostBuild.glfw.RelWithDebInfo:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a:
	/bin/rm -f /Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a




# For each target create a dummy ruleso the target does not have to exist
/Users/juliegerstley/Downloads/Capstone\ 2D/build/Debug/libglad.a:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/MinSizeRel/libglad.a:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/RelWithDebInfo/libglad.a:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/Release/libglad.a:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Debug/libglfw3.a:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/MinSizeRel/libglfw3.a:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/RelWithDebInfo/libglfw3.a:
/Users/juliegerstley/Downloads/Capstone\ 2D/build/glfw-3.2/src/Release/libglfw3.a:
