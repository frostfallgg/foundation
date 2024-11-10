type Inputs = Array<Enum.KeyCode | Enum.PlayerActions | Enum.UserInputType>;
export declare namespace Action {
    function Bind(actionName: string, callback: (BindAction: string, state: Enum.UserInputState, inputObject: InputObject) => void, ...inputTypes: Inputs): LuaTuple<[() => void, string]>;
    function BindWithTouch(actionName: string, callback: (BindAction: string, state: Enum.UserInputState, inputObject: InputObject) => void, ...inputTypes: Inputs): LuaTuple<[() => void, string]>;
}
export {};
