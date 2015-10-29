// Copyright 2015 Shakhzod Ikromov (aka GRiM2D)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

uniform sampler2D u_tex0;
uniform vec2 u_tex0Resolution;
uniform float u_time;

uniform sampler2D u_tex1;
uniform vec2 u_tex1Resolution;

varying vec2 v_texcoord;

float value = 1.0;

void main() {
	float time = u_time;
	vec2 coord = v_texcoord;
	vec4 currentPixel = vec4(1.0, 0.0, 0.0, 1.0);

	value = abs(sin(time / 5.0));
	currentPixel = texture2D(u_tex0, coord);

	if (currentPixel.w > 0.0) {
		if (currentPixel.x <= value) {
			currentPixel.x = 1.0;
			currentPixel.y = 0.44;
			currentPixel.z = 0.0;
		} else {
			currentPixel.w = 0.0;
		}
	}

	// vec4 knobPixel = texture2D(u_tex1, coord);
	// if (knobPixel.w > 0.1) {
	// 	currentPixel = knobPixel;
	// }

	gl_FragColor = currentPixel;
}