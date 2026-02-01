enum INPUT_TYPE { KEY, MOUSE_BUTTON, JOY_BUTTON, JOY_AXIS }

const INPUT_MAP: Dictionary = {
	"move_up": [
		{ "type": INPUT_TYPE.KEY, "value": KEY_W },
		{ "type": INPUT_TYPE.JOY_AXIS, "value": JOY_AXIS_LEFT_Y },
		{ "type": INPUT_TYPE.JOY_BUTTON, "value": JOY_BUTTON_DPAD_UP }
	],
	"move_down": [
		
	],

}
