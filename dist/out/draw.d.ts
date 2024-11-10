export declare namespace Draw {
    interface StaticPartProps {
        color: Color3;
        size: number;
        transparency: number;
    }
    function StaticPart(position: Vector3, props?: StaticPartProps): Part;
    function ClearAll(): void;
}
