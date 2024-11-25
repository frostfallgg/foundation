export declare namespace PriorityQueue {
	interface Struct<T> {
		_heap: Array<{
			item: T;
			priority: number;
		}>;
		_items: Map<T, boolean>;
	}

	function New<T>(): Struct<T>;
	function Enqueue<T>(data: Struct<T>, item: T, priority: number): void;
	function Dequeue<T>(data: Struct<T>): T | undefined;
}
