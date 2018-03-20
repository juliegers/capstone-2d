#version 150

//DO NOT HAVE TO ADJUST VERTEX SHADER

//Input vertices and normals from mesh that pass to GPU and render
in  vec4 vPosition;
in  vec3 vNormal;

//Uniform across all
uniform mat4 ModelView;
uniform mat4 Projection;
uniform mat3 NormalMatrix;

//Two values, position (pos) and normal (N)
out vec4 pos;
out vec4 N;


void main()
{
    
    // Transform vertex normal into eye coordinates
    //Multiply normal my normalmatrix make them all unit vectors, turn into vec4 by adding 0.0 at w term
    N = vec4(normalize(NormalMatrix*vNormal), 0.0);
    
    // Transform vertex position into eye coordinates
    //actual GL position that will be used by renderer
    pos = ModelView * vPosition;
    //Global and hard coded
    gl_Position = Projection * pos;
    
}

