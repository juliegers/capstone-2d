#include "common.h"
#include "SourcePath.h"


using namespace Angel;

//Defining a vec4 to be a color4
typedef vec4 color4;

// Initialize shader lighting parameters
//Do not edit this
//w component is 0, being treated as a vector (extra credit- change to point)
vec4 light_position(   0.0, 0.0, 1.0, 0.0 );
//Ambient, diffuse, and specular terms, fourth component is alpha RBGA (A is opacity)
color4 light_ambient(  0.1, 0.1, 0.1, 1.0 );
color4 light_diffuse(  1.0, 1.0, 1.0, 1.0 );
color4 light_specular( 1.0, 1.0, 1.0, 1.0 );

// Initialize shader material parameters
//This is hardcoded, vary this (keep ambient uniform, vary materials diffuse, specular, and shininess per model)
color4 material_ambient[8] = {color4(0.1745, 0.01175, 0.01175, 1.0 ), color4(0.19125, 0.0735, 0.3225, 1.0 ), color4(0.55, 0.55, 0.55, 1.0 ), color4(0.24725, 0.1995, 0.0745, 1.0 ),
    color4(0.235, 0.6225, 0.2575, 1.0 ), color4(0.19225, 0.19225, 0.19225, 1.0 ), color4(0.1125, 0.1275, 0.954, 1.0 ), color4(0.05375, 0.05, 0.06625, 1.0 )
};
color4 material_diffuse[8] = {color4(0.61424, 0.04136, 0.04136, 1.0 ), color4(0.7038, 0.27048, 0.3828, 1.0 ), color4(  0.65, 0.65, 0.65, 1.0 ), color4(0.75164, 0.60648, 0.22648, 1.0 ),
    color4( 0.64, 0.99, 0.73, 1.0 ), color4( 0.50754, 0.50754, 0.50754, 1.0 ), color4(0.314, 0.4284, 0.98144, 1.0 ), color4( 0.18275, 0.17, 0.22525, 1.0 )
};
color4 material_specular[8] = {color4(0.727811, 0.626959, 0.626959, 1.0 ), color4(0.256777, 0.137622, 0.386014, 1.0 ), color4( 0.8, 0.80, 0.80, 1.0 ), color4( 0.628281, 0.555802, 0.366065, 1.0 ),
    color4(0.416228, 0.716228, 0.416228, 1.0 ), color4(0.508273, 0.508273, 0.508273, 1.0 ), color4(0.193548, 0.271906, 0.966721, 1.0 ), color4(0.332741, 0.328634, 0.346435, 1.0 )
};
float material_shininess[8] = {0.6, 0.1, 0.9, 0.4, 0.7, 0.4, 0.2, 0.3};



//Iterating through all models
//Files in models (obj)- list of vertices and every vertex has a normal, then faces defined (triangles) which reference a vertex index, if they had a mapping UV coordinate they would be in the second position
enum{_CUBE, _CYLINDER, _DODEC, _SPHERE, _CUBOID, _HELIX, _ICOSA, _PYRAMID, _TORUS, _TOTAL_MODELS};
//List of files to load
std::string files[_TOTAL_MODELS] = {
                                    "/models/cube.obj",
                                    "/models/cylinder.obj",
                                    "/models/dodecahedron.obj",
                                    "/models/sphere.obj",
                                    "/models/cuboid.obj",
                                    "/models/helix.obj",
                                    "/models/icosahedron.obj",
                                    "/models/pyramid.obj",
                                    "/models/torus.obj"
    
};

GLuint program;
//Mesh class to read in files and parse
std::vector < Mesh > mesh;

//store random numbers
std::vector < vec2 > offsets;
//store random colors
std::vector <int> coloroffsets;

//Array of vertex array objects and buffer objects
std::vector < GLuint > buffer;
std::vector < GLuint > vao;
//Things in the shader passing things to
GLuint ModelView_loc, NormalMatrix_loc, Projection_loc;
bool wireframe;
//keeping track of current model being drawn
int current_draw;

//User interaction variables
//==========Trackball Variables==========
static float curquat[4],lastquat[4];
/* current transformation matrix */
static float curmat[4][4];
mat4 curmat_a;
/* actual operation  */
bool scaling;
bool moving;
bool panning;
/* starting "moving" coordinates */
static int beginx, beginy;
/* ortho */
float ortho_x, ortho_y;
/* current scale factor */
static float scalefactor;
bool lbutton_down;

//Placeholder
static void error_callback(int error, const char* description)
{
  fprintf(stderr, "Error: %s\n", description);
}

//User interaction handler
//Change between wireframe and models in drawing
static void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods){
  if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
    glfwSetWindowShouldClose(window, GLFW_TRUE);
  if (key == GLFW_KEY_SPACE && action == GLFW_PRESS){
    current_draw = (current_draw+1)%_TOTAL_MODELS;
  }
  if (key == GLFW_KEY_W && action == GLFW_PRESS){
    wireframe = !wireframe;
  }
}

//Rotation and scrolling
//User interaction handler
static void mouse_click(GLFWwindow* window, int button, int action, int mods){
  
  if (GLFW_RELEASE == action){
    moving=scaling=panning=false;
    return;
  }
  
  if( mods & GLFW_MOD_SHIFT){
    scaling=true;
  }else if( mods & GLFW_MOD_ALT ){
    panning=true;
  }else{
    moving=true;
    trackball(lastquat, 0, 0, 0, 0);
  }
  
  double xpos, ypos;
  glfwGetCursorPos(window, &xpos, &ypos);
  beginx = xpos; beginy = ypos;
}


//User interaction handler
void mouse_move(GLFWwindow* window, double x, double y){
  
  int W, H;
  glfwGetFramebufferSize(window, &W, &H);

  
  float dx=(x-beginx)/(float)W;
  float dy=(beginy-y)/(float)H;
  
  if (panning)
    {
    ortho_x  +=dx;
    ortho_y  +=dy;
    
    beginx = x; beginy = y;
    return;
    }
  else if (scaling)
    {
    scalefactor *= (1.0f+dx);
    
    beginx = x;beginy = y;
    return;
    }
  else if (moving)
    {
    trackball(lastquat,
              (2.0f * beginx - W) / W,
              (H - 2.0f * beginy) / H,
              (2.0f * x - W) / W,
              (H - 2.0f * y) / H
              );
    
    add_quats(lastquat, curquat, curquat);
    build_rotmatrix(curmat, curquat);
    
    beginx = x;beginy = y;
    return;
    }
}



//make the array of random numbers and reject them based on bouding boxes here
//give some cut off for things that you test, if you run 100 times and it cant find good position throw it all away and start over
void init(){
  
    //Loading into vertex then fragment shader
  std::string vshader = source_path + "/shaders/vshader.glsl";
  std::string fshader = source_path + "/shaders/fshader.glsl";
  
    //Read in the source for vertex and fragment shaders
  GLchar* vertex_shader_source = readShaderSource(vshader.c_str());
  GLchar* fragment_shader_source = readShaderSource(fshader.c_str());

    //Create vertex shader program
  GLuint vertex_shader = glCreateShader(GL_VERTEX_SHADER);
  glShaderSource(vertex_shader, 1, (const GLchar**) &vertex_shader_source, NULL);
  glCompileShader(vertex_shader);
  check_shader_compilation(vshader, vertex_shader);
  
    //Create fragment cshader program
  GLuint fragment_shader = glCreateShader(GL_FRAGMENT_SHADER);
  glShaderSource(fragment_shader, 1, (const GLchar**) &fragment_shader_source, NULL);
  glCompileShader(fragment_shader);
  check_shader_compilation(fshader, fragment_shader);
  
    //Compile shaders link them and then use them
  program = glCreateProgram();
  glAttachShader(program, vertex_shader);
  glAttachShader(program, fragment_shader);
  
  glLinkProgram(program);
  check_program_link(program);
  
  glUseProgram(program);
  
  glBindFragDataLocation(program, 0, "fragColor");

  //Per vertex attributes
    //Get input to vertex shader and assigning
  GLuint vPosition = glGetAttribLocation( program, "vPosition" );
  GLuint vNormal = glGetAttribLocation( program, "vNormal" );

//  //Compute ambient, diffuse, and specular terms
//  color4 ambient_product  = light_ambient * material_ambient;
//  color4 diffuse_product  = light_diffuse * material_diffuse;
//  color4 specular_product = light_specular * material_specular;
//
//  //Retrieve and set uniform variables
//    //Look for the products and shininess and apply whatever we have computed for those to those locations
//    //Grabbing where light position is in program and setting it to be light position that we set up above
//    //Have to undo to have different properties for models!!!
//    //Grab uniformlocation and retrieve and then per model set, not doing it in one pass
//  glUniform4fv( glGetUniformLocation(program, "LightPosition"), 1, light_position);
//  glUniform4fv( glGetUniformLocation(program, "AmbientProduct"), 1, ambient_product );
//  glUniform4fv( glGetUniformLocation(program, "DiffuseProduct"), 1, diffuse_product );
//  glUniform4fv( glGetUniformLocation(program, "SpecularProduct"), 1, specular_product );
//  glUniform1f(  glGetUniformLocation(program, "Shininess"), material_shininess );
  
  //Matrix uniform variable locations
  ModelView_loc = glGetUniformLocation( program, "ModelView" );
  NormalMatrix_loc = glGetUniformLocation( program, "NormalMatrix" );
  Projection_loc = glGetUniformLocation( program, "Projection" );
  
  //===== Send data to GPU ======
    //For every model have vao and buffer, pass vertices and normals
  vao.resize(_TOTAL_MODELS);
  glGenVertexArrays( _TOTAL_MODELS, &vao[0] );
  
  buffer.resize(_TOTAL_MODELS);
  glGenBuffers( _TOTAL_MODELS, &buffer[0] );
  
  for(unsigned int i=0; i < _TOTAL_MODELS; i++){
    mesh.push_back((source_path + files[i]).c_str());

    glBindVertexArray( vao[i] );
    glBindBuffer( GL_ARRAY_BUFFER, buffer[i] );
    unsigned int vertices_bytes = mesh[i].vertices.size()*sizeof(vec4);
    unsigned int normals_bytes  = mesh[i].normals.size()*sizeof(vec3);
    
    glBufferData( GL_ARRAY_BUFFER, vertices_bytes + normals_bytes, NULL, GL_STATIC_DRAW );
    unsigned int offset = 0;
    glBufferSubData( GL_ARRAY_BUFFER, offset, vertices_bytes, &mesh[i].vertices[0] );
    offset += vertices_bytes;
    glBufferSubData( GL_ARRAY_BUFFER, offset, normals_bytes,  &mesh[i].normals[0] );
    
    glEnableVertexAttribArray( vNormal );
    glEnableVertexAttribArray( vPosition );

    glVertexAttribPointer( vPosition, 4, GL_FLOAT, GL_FALSE, 0, BUFFER_OFFSET(0) );
    glVertexAttribPointer( vNormal, 3, GL_FLOAT, GL_FALSE, 0, BUFFER_OFFSET(mesh[i].vertices.size()*sizeof(vec4)) );

  }
    srand (time(NULL));

    offsets.resize(mesh.size());
    for(unsigned int i=0; i < offsets.size(); i++){
        offsets[i].x = -3.5 + rand()/(float)RAND_MAX * 7;;
        offsets[i].y = -3.5 + rand()/(float)RAND_MAX  * 7;
        
        std::cout << "Testing model " << i << "\n";
        
        vec4 box_min = Translate(offsets[i].x, offsets[i].y, 0.0)*mesh[i].model_view*mesh[i].box_min;
        vec4 box_max = Translate(offsets[i].x, offsets[i].y, 0.0)*mesh[i].model_view*mesh[i].box_max;
        std::cout << box_min << "\t\t" << box_max << "\n";

        bool didIhit = false;
        for(unsigned int j=0; j < i; j++){
            vec4 box_min_t = Translate(offsets[j].x, offsets[j].y, 0.0)*mesh[j].model_view*mesh[j].box_min;
            vec4 box_max_t = Translate(offsets[j].x, offsets[j].y, 0.0)*mesh[j].model_view*mesh[j].box_max;
            
            box_min_t -= vec4(0.1, 0.1, 0.1, 0.0);
            box_max_t += vec4(0.1, 0.1, 0.1, 0.0);

            if( (box_min.x <= box_max_t.x && box_max.x >= box_min_t.x) &&
                (box_min.y <= box_max_t.y && box_max.y >= box_min_t.y)
               )
            {
                didIhit = true;
                break;
            }
        }
        
        if(didIhit){
            std::cout << "reject\n";
            i--; continue;
        }else{
            std::cout << "accept\n";
        }
        
    }
    
    //do same thing with colors
    coloroffsets.resize(mesh.size());
    for(unsigned int i=0; i < coloroffsets.size(); i++){
        coloroffsets[i] = rand() % 8;
    }
    
    
  //===== End: Send data to GPU ======


  // ====== Enable some opengl capabilitions ======
  //Flip bit in GLstate machine to use the Z buffer?
    glEnable( GL_DEPTH_TEST );
    //Interpolate the model for smooth shading
  glShadeModel(GL_SMOOTH);

    //Set background color
  glClearColor( .8, .8, .8, 1.0 );
  
  //===== Initalize some program state variables ======

  //Quaternion trackball variables, you can ignore
  scaling  = 0;
  moving   = 0;
  panning  = 0;
  beginx   = 0;
  beginy   = 0;
  
  matident(curmat);
  trackball(curquat , 0.0f, 0.0f, 0.0f, 0.0f);
  trackball(lastquat, 0.0f, 0.0f, 0.0f, 0.0f);
  add_quats(lastquat, curquat, curquat);
  build_rotmatrix(curmat, curquat);
  
  scalefactor = 1.0;
  
  wireframe = false;
  current_draw = 0;
  
  lbutton_down = false;


  //===== End: Initalize some program state variables ======

}


int main(void){
  
  GLFWwindow* window;
  
  glfwSetErrorCallback(error_callback);
  
  if (!glfwInit())
    exit(EXIT_FAILURE);
  
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
  glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
  
  glfwWindowHint(GLFW_SAMPLES, 4);
  
  window = glfwCreateWindow(1000, 1000, "Assignment 3 - 3D Shading", NULL, NULL);
  if (!window){
    glfwTerminate();
    exit(EXIT_FAILURE);
  }
  
  //Set key and mouse callback functions
  glfwSetKeyCallback(window, key_callback);
  glfwSetMouseButtonCallback(window, mouse_click);
  glfwSetCursorPosCallback(window, mouse_move);

  
  glfwMakeContextCurrent(window);
  gladLoadGLLoader((GLADloadproc) glfwGetProcAddress);
  glfwSwapInterval(1);
  
  init();

    
  while (!glfwWindowShouldClose(window)){
    
    //Display as wirfram, boolean tied to keystoke 'w'
      //Tell GL state machine to show wire frame or actual model
    if(wireframe){
      glPolygonMode( GL_FRONT_AND_BACK, GL_LINE );
    }else{
      glPolygonMode( GL_FRONT_AND_BACK, GL_FILL );
    }
    
    int width, height;
    glfwGetFramebufferSize(window, &width, &height);
    glViewport(0, 0, width, height);
    
    GLfloat aspect = GLfloat(width)/height;
    
    //Projection matrix
      //Perspective 3D projection- use as blackbox right now
    mat4  projection = Perspective( 45.0, aspect, 0.5, 30.0 );
    
      //Clear both depth and colors
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    //"Camera" position
    const vec3 viewer_pos( 0.0, 0.0, 10.0 );
    
    //Track_ball rotation matrix
    mat4 track_ball =  mat4(curmat[0][0], curmat[1][0], curmat[2][0], curmat[3][0],
                            curmat[0][1], curmat[1][1], curmat[2][1], curmat[3][1],
                            curmat[0][2], curmat[1][2], curmat[2][2], curmat[3][2],
                            curmat[0][3], curmat[1][3], curmat[2][3], curmat[3][3]);
      
      //for loop all shapes
      for(unsigned int i=0; i < mesh.size(); i++){
          //Compute ambient, diffuse, and specular terms
          color4 ambient_product  = light_ambient * material_ambient[i];
          color4 diffuse_product  = light_diffuse * material_diffuse[i];
          color4 specular_product = light_specular * material_specular[i];
          
          glUniform4fv( glGetUniformLocation(program, "LightPosition"), 1, light_position);
          glUniform4fv( glGetUniformLocation(program, "AmbientProduct"), 1, ambient_product );
          glUniform4fv( glGetUniformLocation(program, "DiffuseProduct"), 1, diffuse_product );
          glUniform4fv( glGetUniformLocation(program, "SpecularProduct"), 1, specular_product );
          glUniform1f(  glGetUniformLocation(program, "Shininess"), material_shininess[i] );
          
          //make random variable between -3.5 and 3.5
          //assign x and y to different variables
          
           mat4 user_MV  =  Translate( -viewer_pos ) * Translate(offsets[i].x, offsets[i].y, 0.0);
          // ====== Draw ======
          //Bind vertex array to what we are currently drawing
          glBindVertexArray(vao[i]);
          //glBindBuffer( GL_ARRAY_BUFFER, buffer[current_draw] ); Not necessary?
    
          //Pass the data that is attached to modelview matrix in vertex shader
          //Each mesh has its own modelview
          glUniformMatrix4fv( ModelView_loc, 1, GL_TRUE, user_MV*mesh[i].model_view);
          //Pass projection matrix
          glUniformMatrix4fv( Projection_loc, 1, GL_TRUE, projection );
          //Pass computed normal matrix
          glUniformMatrix3fv( NormalMatrix_loc, 1, GL_TRUE, Normal(user_MV*mesh[i].model_view) );

          glDrawArrays( GL_TRIANGLES, 0, mesh[i].vertices.size() );
      }
    // ====== End: Draw ======

    
    glfwSwapBuffers(window);
    glfwPollEvents();
    
  }
  
  glfwDestroyWindow(window);
  
  glfwTerminate();
  exit(EXIT_SUCCESS);
}
