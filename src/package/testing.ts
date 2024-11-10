import { Players, RunService } from "@rbxts/services";

export namespace Testing {
	export function SetLocalCharacterSpeed(speed = 24) {
		if (!RunService.IsClient()) {
			return;
		}
		const character = Players.LocalPlayer.Character || Players.LocalPlayer.CharacterAdded.Wait()[0];

		try {
			const humanoid = character.WaitForChild("Humanoid") as Humanoid;
			humanoid.WalkSpeed = speed;
		} catch (e) {
			warn(`Could not find Humanoid on ${character.Name}`);
			return;
		}
	}
}
