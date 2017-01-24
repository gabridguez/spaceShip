// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 23.6KB

// Skipping shader variants that would not be included into build of current scene.

Shader "Particles/Additive" {
Properties {
 _TintColor ("Tint Color", Color) = (0.500000,0.500000,0.500000,0.500000)
 _MainTex ("Particle Texture", 2D) = "white" { }
 _InvFade ("Soft Particles Factor", Range(0.010000,3.000000)) = 1.000000
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "PreviewType"="Plane" }


 // Stats for Vertex shader:
 //       d3d11 : 9 avg math (5..13)
 //    d3d11_9x : 9 avg math (5..13)
 //        d3d9 : 11 avg math (7..15)
 // Stats for Fragment shader:
 //       d3d11 : 6 avg math (3..9), 1 avg texture (1..2)
 //    d3d11_9x : 6 avg math (3..9), 1 avg texture (1..2)
 //        d3d9 : 8 avg math (4..12), 1 avg texture (1..2)
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "PreviewType"="Plane" }
  ZWrite Off
  Cull Off
  Blend SrcAlpha One
  ColorMask RGB
  GpuProgramID 58941
Program "vp" {
SubProgram "d3d9 " {
// Stats: 7 math
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_MainTex_ST]
"//
// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
//
// Parameters:
//
//   float4 _MainTex_ST;
//   row_major float4x4 glstate_matrix_mvp;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   glstate_matrix_mvp c0       4
//   _MainTex_ST        c4       1
//

    vs_2_0
    def c5, 1, 0, 0, 0
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    mad r0, v0.xyzx, c5.xxxy, c5.yyyx
    dp4 oPos.x, c0, r0
    dp4 oPos.y, c1, r0
    dp4 oPos.z, c2, r0
    dp4 oPos.w, c3, r0
    mad oT0.xy, v2, c4, c4.zwzw
    mov oD0, v1

// approximately 7 instruction slots used
"
}
SubProgram "d3d11 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 352
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyz 
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
      vs_4_0
      dcl_constantbuffer cb0[8], immediateIndexed
      dcl_constantbuffer cb1[4], immediateIndexed
      dcl_input v0.xyz
      dcl_input v1.xyzw
      dcl_input v2.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xy
      dcl_temps 1
   0: mul r0.xyzw, v0.yyyy, cb1[1].xyzw
   1: mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
   3: add o0.xyzw, r0.xyzw, cb1[3].xyzw
   4: mov o1.xyzw, v1.xyzw
   5: mad o2.xy, v2.xyxx, cb0[7].xyxx, cb0[7].zwzz
   6: ret 
// Approximately 0 instruction slots used
"
}
SubProgram "d3d11_9x " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 352
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyz 
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Constant buffer to DX9 shader constant mappings:
//
// Target Reg Buffer  Start Reg # of Regs        Data Conversion
// ---------- ------- --------- --------- ----------------------
// c1         cb0             7         1  ( FLT, FLT, FLT, FLT)
// c2         cb1             0         4  ( FLT, FLT, FLT, FLT)
//
//
// Runtime generated constant mappings:
//
// Target Reg                               Constant Description
// ---------- --------------------------------------------------
// c0                              Vertex Shader position offset
//
//
// Level9 shader bytecode:
//
    vs_2_0
          dcl_texcoord v0
          dcl_texcoord1 v1
          dcl_texcoord2 v2
   0:     mad oT1.xy, v2, c1, c1.zwzw
   1:     mul r0, v0.y, c3
   2:     mad r0, c2, v0.x, r0
   3:     mad r0, c4, v0.z, r0
   4:     add r0, r0, c5
   5:     mad oPos.xy, r0.w, c0, r0
   6:     mov oPos.zw, r0
   7:     mov oT0, v1

// approximately 8 instruction slots used
      vs_4_0
      dcl_constantbuffer cb0[8], immediateIndexed
      dcl_constantbuffer cb1[4], immediateIndexed
      dcl_input v0.xyz
      dcl_input v1.xyzw
      dcl_input v2.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xy
      dcl_temps 1
   0: mul r0.xyzw, v0.yyyy, cb1[1].xyzw
   1: mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
   3: add o0.xyzw, r0.xyzw, cb1[3].xyzw
   4: mov o1.xyzw, v1.xyzw
   5: mad o2.xy, v2.xyxx, cb0[7].xyxx, cb0[7].zwzz
   6: ret 
// Approximately 0 instruction slots used
"
}
SubProgram "d3d9 " {
// Stats: 15 math
Keywords { "SOFTPARTICLES_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 4 [glstate_matrix_modelview0] 3
Matrix 0 [glstate_matrix_mvp]
Vector 9 [_MainTex_ST]
Vector 7 [_ProjectionParams]
Vector 8 [_ScreenParams]
"//
// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
//
// Parameters:
//
//   float4 _MainTex_ST;
//   float4 _ProjectionParams;
//   float4 _ScreenParams;
//   row_major float4x4 glstate_matrix_modelview0;
//   row_major float4x4 glstate_matrix_mvp;
//
//
// Registers:
//
//   Name                      Reg   Size
//   ------------------------- ----- ----
//   glstate_matrix_mvp        c0       4
//   glstate_matrix_modelview0 c4       3
//   _ProjectionParams         c7       1
//   _ScreenParams             c8       1
//   _MainTex_ST               c9       1
//

    vs_2_0
    def c10, 1, 0, 0.5, 0
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    mad r0, v0.xyzx, c10.xxxy, c10.yyyx
    dp4 oPos.z, c2, r0
    dp4 r1.x, c0, r0
    dp4 r1.w, c3, r0
    mul r2.xz, r1.xyww, c10.z
    dp4 r1.y, c1, r0
    dp4 r0.x, c6, r0
    mov oT2.z, -r0.x
    mul r0.x, r1.y, c7.x
    mov oPos.xyw, r1
    mov oT2.w, r1.w
    mul r2.w, r0.x, c10.z
    mad oT2.xy, r2.z, c8.zwzw, r2.xwzw
    mad oT0.xy, v2, c9, c9.zwzw
    mov oD0, v1

// approximately 15 instruction slots used
"
}
SubProgram "d3d11 " {
// Stats: 13 math
Keywords { "SOFTPARTICLES_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 144
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 352
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyz 
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer cb0[8], immediateIndexed
      dcl_constantbuffer cb1[6], immediateIndexed
      dcl_constantbuffer cb2[8], immediateIndexed
      dcl_input v0.xyz
      dcl_input v1.xyzw
      dcl_input v2.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xy
      dcl_output o3.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mov o0.xyzw, r0.xyzw
   5: mov o1.xyzw, v1.xyzw
   6: mad o2.xy, v2.xyxx, cb0[7].xyxx, cb0[7].zwzz
   7: mul r0.y, r0.y, cb1[5].x
   8: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
   9: mov o3.w, r0.w
  10: add o3.xy, r1.zzzz, r1.xwxx
  11: mul r0.x, v0.y, cb2[5].z
  12: mad r0.x, cb2[4].z, v0.x, r0.x
  13: mad r0.x, cb2[6].z, v0.z, r0.x
  14: add r0.x, r0.x, cb2[7].z
  15: mov o3.z, -r0.x
  16: ret 
// Approximately 0 instruction slots used
"
}
SubProgram "d3d11_9x " {
// Stats: 13 math
Keywords { "SOFTPARTICLES_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 144
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 352
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyz 
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
//
//
// Constant buffer to DX9 shader constant mappings:
//
// Target Reg Buffer  Start Reg # of Regs        Data Conversion
// ---------- ------- --------- --------- ----------------------
// c1         cb0             7         1  ( FLT, FLT, FLT, FLT)
// c2         cb1             5         1  ( FLT, FLT, FLT, FLT)
// c3         cb2             0         8  ( FLT, FLT, FLT, FLT)
//
//
// Runtime generated constant mappings:
//
// Target Reg                               Constant Description
// ---------- --------------------------------------------------
// c0                              Vertex Shader position offset
//
//
// Level9 shader bytecode:
//
    vs_2_0
          def c11, 0.5, 0, 0, 0
          dcl_texcoord v0
          dcl_texcoord1 v1
          dcl_texcoord2 v2
   0:     mul r0, v0.y, c4
   1:     mad r0, c3, v0.x, r0
   2:     mad r0, c5, v0.z, r0
   3:     add r0, r0, c6
   4:     mul r1.x, r0.y, c2.x
   5:     mul r1.w, r1.x, c11.x
   6:     mul r1.xz, r0.xyww, c11.x
   7:     add oT2.xy, r1.z, r1.xwzw
   8:     mul r1.x, v0.y, c8.z
   9:     mad r1.x, c7.z, v0.x, r1.x
  10:     mad r1.x, c9.z, v0.z, r1.x
  11:     add r1.x, r1.x, c10.z
  12:     mov oT2.z, -r1.x
  13:     mad oT1.xy, v2, c1, c1.zwzw
  14:     mad oPos.xy, r0.w, c0, r0
  15:     mov oPos.zw, r0
  16:     mov oT2.w, r0.w
  17:     mov oT0, v1

// approximately 18 instruction slots used
      vs_4_0
      dcl_constantbuffer cb0[8], immediateIndexed
      dcl_constantbuffer cb1[6], immediateIndexed
      dcl_constantbuffer cb2[8], immediateIndexed
      dcl_input v0.xyz
      dcl_input v1.xyzw
      dcl_input v2.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xy
      dcl_output o3.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mov o0.xyzw, r0.xyzw
   5: mov o1.xyzw, v1.xyzw
   6: mad o2.xy, v2.xyxx, cb0[7].xyxx, cb0[7].zwzz
   7: mul r0.y, r0.y, cb1[5].x
   8: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
   9: mov o3.w, r0.w
  10: add o3.xy, r1.zzzz, r1.xwxx
  11: mul r0.x, v0.y, cb2[5].z
  12: mad r0.x, cb2[4].z, v0.x, r0.x
  13: mad r0.x, cb2[6].z, v0.z, r0.x
  14: add r0.x, r0.x, cb2[7].z
  15: mov o3.z, -r0.x
  16: ret 
// Approximately 0 instruction slots used
"
}
}
Program "fp" {
SubProgram "d3d9 " {
// Stats: 4 math, 1 textures
Vector 0 [_TintColor]
SetTexture 0 [_MainTex] 2D 0
"//
// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
//
// Parameters:
//
//   sampler2D _MainTex;
//   float4 _TintColor;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   _TintColor   c0       1
//   _MainTex     s0       1
//

    ps_2_0
    dcl v0
    dcl t0.xy
    dcl_2d s0
    texld r0, t0, s0
    mul r1, v0, c0
    add r1, r1, r1
    mul_pp r0, r0, r1
    mov_pp oC0, r0

// approximately 5 instruction slots used (1 texture, 4 arithmetic)
"
}
SubProgram "d3d11 " {
// Stats: 3 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 96 [_TintColor]
BindCB  "$Globals" 0
"//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer cb0[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_input_ps linear v1.xyzw
      dcl_input_ps linear v2.xy
      dcl_output o0.xyzw
      dcl_temps 2
   0: add r0.xyzw, v1.xyzw, v1.xyzw
   1: mul r0.xyzw, r0.xyzw, cb0[6].xyzw
   2: sample r1.xyzw, v2.xyxx, t0.xyzw, s0
   3: mul o0.xyzw, r0.xyzw, r1.xyzw
   4: ret 
// Approximately 0 instruction slots used
"
}
SubProgram "d3d11_9x " {
// Stats: 3 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 96 [_TintColor]
BindCB  "$Globals" 0
"//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
//
// Constant buffer to DX9 shader constant mappings:
//
// Target Reg Buffer  Start Reg # of Regs        Data Conversion
// ---------- ------- --------- --------- ----------------------
// c0         cb0             6         1  ( FLT, FLT, FLT, FLT)
//
//
// Sampler/Resource to DX9 shader sampler mappings:
//
// Target Sampler Source Sampler  Source Resource
// -------------- --------------- ----------------
// s0             s0              t0               
//
//
// Level9 shader bytecode:
//
    ps_2_0
          dcl t0
          dcl t1.xy
          dcl_2d s0
   0:     texld r0, t1, s0
   0:     mul r1, t0, c0
   1:     add r1, r1, r1
   2:     mul_pp r0, r0, r1
   3:     mov_pp oC0, r0

// approximately 5 instruction slots used (1 texture, 4 arithmetic)
      ps_4_0
      dcl_constantbuffer cb0[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_input_ps linear v1.xyzw
      dcl_input_ps linear v2.xy
      dcl_output o0.xyzw
      dcl_temps 2
   0: add r0.xyzw, v1.xyzw, v1.xyzw
   1: mul r0.xyzw, r0.xyzw, cb0[6].xyzw
   2: sample r1.xyzw, v2.xyxx, t0.xyzw, s0
   3: mul o0.xyzw, r0.xyzw, r1.xyzw
   4: ret 
// Approximately 0 instruction slots used
"
}
SubProgram "d3d9 " {
// Stats: 12 math, 2 textures
Keywords { "SOFTPARTICLES_ON" }
Float 2 [_InvFade]
Vector 1 [_TintColor]
Vector 0 [_ZBufferParams]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_CameraDepthTexture] 2D 1
"//
// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
//
// Parameters:
//
//   sampler2D _CameraDepthTexture;
//   float _InvFade;
//   sampler2D _MainTex;
//   float4 _TintColor;
//   float4 _ZBufferParams;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   _ZBufferParams      c0       1
//   _TintColor          c1       1
//   _InvFade            c2       1
//   _MainTex            s0       1
//   _CameraDepthTexture s1       1
//

    ps_2_0
    def c3, 2, 0, 0, 0
    dcl v0
    dcl t0.xy
    dcl t2
    dcl_2d s0
    dcl_2d s1
    texldp r0, t2, s1
    texld r1, t0, s0
    mad r0.x, c0.z, r0.x, c0.w
    rcp r0.x, r0.x
    add r0.x, r0.x, -t2.z
    mul_sat r0.x, r0.x, c2.x
    mul_pp r0.x, r0.x, v0.w
    mul r0.x, r0.x, c3.x
    mul r0.w, r0.x, c1.w
    mov r2.xyz, v0
    mul r2.xyz, r2, c1
    mul r0.xyz, r2, c3.x
    mul_pp r0, r1, r0
    mov_pp oC0, r0

// approximately 14 instruction slots used (2 texture, 12 arithmetic)
"
}
SubProgram "d3d11 " {
// Stats: 9 math, 2 textures
Keywords { "SOFTPARTICLES_ON" }
SetTexture 0 [_CameraDepthTexture] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 96 [_TintColor]
Float 128 [_InvFade]
ConstBuffer "UnityPerCamera" 144
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer cb0[9], immediateIndexed
      dcl_constantbuffer cb1[8], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_input_ps linear v1.xyzw
      dcl_input_ps linear v2.xy
      dcl_input_ps linear v3.xyzw
      dcl_output o0.xyzw
      dcl_temps 2
   0: div r0.xy, v3.xyxx, v3.wwww
   1: sample r0.xyzw, r0.xyxx, t0.xyzw, s1
   2: mad r0.x, cb1[7].z, r0.x, cb1[7].w
   3: div r0.x, l(1.000000, 1.000000, 1.000000, 1.000000), r0.x
   4: add r0.x, r0.x, -v3.z
   5: mul_sat r0.x, r0.x, cb0[8].x
   6: mul r0.w, r0.x, v1.w
   7: mov r0.xyz, v1.xyzx
   8: add r0.xyzw, r0.xyzw, r0.xyzw
   9: mul r0.xyzw, r0.xyzw, cb0[6].xyzw
  10: sample r1.xyzw, v2.xyxx, t1.xyzw, s0
  11: mul o0.xyzw, r0.xyzw, r1.xyzw
  12: ret 
// Approximately 0 instruction slots used
"
}
SubProgram "d3d11_9x " {
// Stats: 9 math, 2 textures
Keywords { "SOFTPARTICLES_ON" }
SetTexture 0 [_CameraDepthTexture] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 96 [_TintColor]
Float 128 [_InvFade]
ConstBuffer "UnityPerCamera" 144
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
//
// Constant buffer to DX9 shader constant mappings:
//
// Target Reg Buffer  Start Reg # of Regs        Data Conversion
// ---------- ------- --------- --------- ----------------------
// c0         cb0             6         1  ( FLT, FLT, FLT, FLT)
// c1         cb0             8         1  ( FLT, FLT, FLT, FLT)
// c2         cb1             7         1  ( FLT, FLT, FLT, FLT)
//
//
// Sampler/Resource to DX9 shader sampler mappings:
//
// Target Sampler Source Sampler  Source Resource
// -------------- --------------- ----------------
// s0             s0              t1               
// s1             s1              t0               
//
//
// Level9 shader bytecode:
//
    ps_2_0
          def c3, 2, 0, 0, 0
          dcl t0
          dcl t1.xy
          dcl t2
          dcl_2d s0
          dcl_2d s1
   0:     rcp r0.w, t2.w
   1:     mul r0.xy, r0.w, t2
   2:     texld r0, r0, s1
   2:     texld r1, t1, s0
   2:     mad r0.x, c2.z, r0.x, c2.w
   3:     rcp r0.x, r0.x
   4:     add r0.x, r0.x, -t2.z
   5:     mul_sat r0.x, r0.x, c1.x
   6:     mul_pp r0.x, r0.x, t0.w
   7:     mul r0.x, r0.x, c3.x
   8:     mul r0.w, r0.x, c0.w
   9:     mov r2.xyz, t0
  10:     mul r2.xyz, r2, c0
  11:     mul r0.xyz, r2, c3.x
  12:     mul_pp r0, r1, r0
  13:     mov_pp oC0, r0

// approximately 16 instruction slots used (2 texture, 14 arithmetic)
      ps_4_0
      dcl_constantbuffer cb0[9], immediateIndexed
      dcl_constantbuffer cb1[8], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_input_ps linear v1.xyzw
      dcl_input_ps linear v2.xy
      dcl_input_ps linear v3.xyzw
      dcl_output o0.xyzw
      dcl_temps 2
   0: div r0.xy, v3.xyxx, v3.wwww
   1: sample r0.xyzw, r0.xyxx, t0.xyzw, s1
   2: mad r0.x, cb1[7].z, r0.x, cb1[7].w
   3: div r0.x, l(1.000000, 1.000000, 1.000000, 1.000000), r0.x
   4: add r0.x, r0.x, -v3.z
   5: mul_sat r0.x, r0.x, cb0[8].x
   6: mul r0.w, r0.x, v1.w
   7: mov r0.xyz, v1.xyzx
   8: add r0.xyzw, r0.xyzw, r0.xyzw
   9: mul r0.xyzw, r0.xyzw, cb0[6].xyzw
  10: sample r1.xyzw, v2.xyxx, t1.xyzw, s0
  11: mul o0.xyzw, r0.xyzw, r1.xyzw
  12: ret 
// Approximately 0 instruction slots used
"
}
}
 }
}
}