#version 150

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
uniform vec3 spectrum;
uniform sampler2D texture0;
uniform sampler2D texture1;
uniform sampler2D texture2;
uniform sampler2D texture3;
uniform sampler2D prevFrame;

in VertexData
{
    vec4 v_position;
    vec3 v_normal;
    vec2 v_texcoord;
} inData;

out vec4 fragColor;

float pattern01(vec2 p, float distosion)
{
    float pmx = mod(p.x, 1000.0);
    return sin(pmx + distosion*sin(p.y/distosion));
}

float pattern02(vec2 p, float distorsion)
{
    float pmy = mod(p.y, 1000.0);
    return sin(pmy + distorsion*sin(p.x/distorsion));
}

void main()
{
    float t = time * 0.1;
    fragColor = vec4(pattern01(gl_FragCoord.xy + cos(t)*5.0, 6.0 + sin(t)*0.05)) + pattern02(gl_FragCoord.xy + sin(t)*5.0, 8+0.02*sin(t));
}
