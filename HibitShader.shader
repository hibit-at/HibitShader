Shader "Hibit/HibitShader" {
	Properties {
		_Color ("Color", Color) = (.5,.5,.5,1)
		_RimColor ("RimColor", Color) = (.5,.5,.5,1)
		_MainTex ("MainTex", 2D) = "white" {}
		_NormalMap ("NormalMap", 2D) = "white" {}
		_Change ("Change", Range (0,6.28)) = 0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		Cull Off

		CGPROGRAM
		#pragma surface surf Custom
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _NormalMap;
		fixed4 _Color;
		fixed4 _RimColor;
		float _Change;

		struct Input {
		float2 uv_MainTex;
		float2 uv_NormalMap;
      		float3 viewDir;
		};

		fixed4 LightingCustom (SurfaceOutput s, fixed3 lightDir, fixed atten) {
		half d = dot(s.Normal, lightDir)*0.2+0.2;
		fixed4 c;
		c.rgb = s.Albedo.rgb * _LightColor0.rgb * ((_Color-.5)/3+d);
		return c;
		}
		void surf (Input IN, inout SurfaceOutput o) {
		fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
		half rim = 1 - saturate(dot(IN.viewDir, o.Normal));
		fixed3 rot = fixed3(saturate(cos(_Change)),saturate(cos(_Change+UNITY_PI*2/3)),saturate(cos(_Change+UNITY_PI*4/3)));
		fixed3 Crgb = fixed3(dot(rot,c.rgb),dot(rot,c.gbr),dot(rot,c.brg));
		half3 environment = ShadeSH9(half4(o.Normal, 1));
     		o.Emission = (2*Crgb+_RimColor)/3 * pow(rim, 3)*environment*2;
		o.Albedo = Crgb;
		o.Normal = UnpackNormal(tex2D (_NormalMap, IN.uv_NormalMap));
		}
		ENDCG
	}
	FallBack "Diffuse"
}
