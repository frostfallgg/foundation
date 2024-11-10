import { Workspace } from "@rbxts/services";

const DEFAULT_STATIC_PART_PROPS: Draw.StaticPartProps = {
	color: Color3.fromRGB(51, 125, 54),
	size: 1,
	transparency: 0,
};

let container = Workspace.FindFirstChild("draw-container") as Folder;
if (!container) {
	container = new Instance("Folder");
	container.Name = "draw-container";
	container.Parent = Workspace;
}

export namespace Draw {
	export interface StaticPartProps {
		color: Color3;
		size: number;
		transparency: number;
	}

	export function StaticPart(position: Vector3, props?: StaticPartProps) {
		const propsToUse: StaticPartProps = { ...DEFAULT_STATIC_PART_PROPS, ...props };
		const part = new Instance("Part");
		part.Size = new Vector3(propsToUse.size, propsToUse.size, propsToUse.size);
		part.Transparency = propsToUse.transparency;
		part.Color = propsToUse.color;
		part.Anchored = true;
		part.CanCollide = false;
		part.CanTouch = false;
		part.CastShadow = false;
		part.CanQuery = false;
		part.Shape = Enum.PartType.Ball;
		part.Material = Enum.Material.SmoothPlastic;
		part.Position = position;
		part.Parent = container;
		return part;
	}

	export function ClearAll() {
		for (const child of container.GetChildren()) {
			child.Destroy();
		}
	}
}
