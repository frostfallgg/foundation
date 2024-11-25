export declare namespace Queue {
	interface Struct<T> {
		data: T[];
		front: number;
		rear: number;
	}

	function New<T>(): Struct<T>;
	function Enqueue<T>(data: Struct<T>, item: T): void;
	function Dequeue<T>(data: Struct<T>): T | undefined;
	function Peek<T>(data: Struct<T>): T;
	function IsEmpty<T>(data: Struct<T>): boolean;
	function Size<T>(data: Struct<T>): number;
}
