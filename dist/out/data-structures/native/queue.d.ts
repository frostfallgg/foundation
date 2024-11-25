export declare namespace Queue {
	interface Queue<T> {
		data: T[];
		front: number;
		rear: number;
	}

	function New<T>(): Queue<T>;
	function Enqueue<T>(data: Queue<T>, item: T): void;
	function Dequeue<T>(data: Queue<T>): T | undefined;
	function Peek<T>(data: Queue<T>): T;
	function IsEmpty<T>(data: Queue<T>): boolean;
	function Size<T>(data: Queue<T>): number;
}
