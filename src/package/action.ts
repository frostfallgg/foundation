import { ContextActionService } from "@rbxts/services";

type Inputs = Array<Enum.KeyCode | Enum.PlayerActions | Enum.UserInputType>;

export namespace Action {
	export function Bind(
		actionName: string,
		callback: (BindAction: string, state: Enum.UserInputState, inputObject: InputObject) => void,
		...inputTypes: Inputs
	) {
		ContextActionService.BindAction(actionName, callback, false, ...inputTypes);
		return $tuple(() => ContextActionService.UnbindAction(actionName), actionName);
	}

	export function BindWithTouch(
		actionName: string,
		callback: (BindAction: string, state: Enum.UserInputState, inputObject: InputObject) => void,
		...inputTypes: Inputs
	) {
		ContextActionService.BindAction(actionName, callback, true, ...inputTypes);
		return $tuple(() => ContextActionService.UnbindAction(actionName), actionName);
	}
}
