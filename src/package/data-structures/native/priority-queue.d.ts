export declare namespace PriorityQueue {
	interface PriorityQueueStruct<T> {
		_heap: Array<{
			item: T;
			priority: number;
		}>;
		_items: Map<T, boolean>;
	}

	function New<T>(): PriorityQueueStruct<T>;
	function Enqueue<T>(data: PriorityQueueStruct<T>, item: T, priority: number): void;
	function Dequeue<T>(data: PriorityQueueStruct<T>): T | undefined;
}
