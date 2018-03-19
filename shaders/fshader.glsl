#version 150

//Colors (products) come in and are used in shader
uniform vec4 AmbientProduct;
uniform vec4 DiffuseProduct;
uniform vec4 SpecularProduct;
//Light position
uniform vec4 LightPosition;
//Float shininess
uniform float Shininess;

//From vertex shader get positions for each fragment and normals
//What makes it phong
//Get interpolated per fragment
in vec4 pos;
in vec4 N;

out vec4 fragColor;

void main()
{
  
  // Ambient
  vec4 ambient = AmbientProduct;
  
  // Diffuse
  float Kd = max(dot(N, LightPosition), 0.0);
  vec4  diffuse = Kd*DiffuseProduct;
  
  //Specular
  //Compute R and V
  vec4 E = vec4(0.0, 0.0, 0.0, 1.0);
  vec4 V = normalize(E - pos);
  float Ks = pow(max(dot(normalize(-reflect(LightPosition, N)), V),0.0), Shininess);
  vec4  specular = Ks * SpecularProduct;
  
  //FragColor is what is sent out to color pixel based on fragment
  if((dot(LightPosition, N)) < 0) {
      fragColor = vec4(0.0, 0.0, 0.0, 1.0);
  }
  fragColor = ambient + diffuse + specular;
  
  //Assignment is to adjust diffuse and specular and do some tests
}

//Start with diffuse, then specular,

