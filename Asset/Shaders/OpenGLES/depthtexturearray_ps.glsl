#version 310 es
precision mediump float;
precision highp int;

struct Light
{
    highp float lightIntensity;
    int lightType;
    int lightCastShadow;
    int lightShadowMapIndex;
    int lightAngleAttenCurveType;
    int lightDistAttenCurveType;
    highp vec2 lightSize;
    ivec4 lightGUID;
    highp vec4 lightPosition;
    highp vec4 lightColor;
    highp vec4 lightDirection;
    highp vec4 lightDistAttenCurveParams[2];
    highp vec4 lightAngleAttenCurveParams[2];
    highp mat4 lightVP;
    highp vec4 padding[2];
};

struct debugPushConstants
{
    highp float layer_index;
};

uniform debugPushConstants u_pushConstants;

layout(binding = 0) uniform highp sampler2DArray depthSampler;

layout(location = 0) out highp vec3 color;
layout(location = 0) in highp vec2 UV;

void main()
{
    color = texture(depthSampler, vec3(UV, u_pushConstants.layer_index)).xxx;
}

