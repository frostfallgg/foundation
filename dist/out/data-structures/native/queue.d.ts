export declare namespace Queue {
	interface QueueStruct<T> {
		data: T[];
		front: number;
		rear: number;
	}

	function New<T>(): QueueStruct<T>;
	function Enqueue<T>(data: QueueStruct<T>, item: T): void;
	function Dequeue<T>(data: QueueStruct<T>): T | undefined;
	function Peek<T>(data: QueueStruct<T>): T;
	function IsEmpty<T>(data: QueueStruct<T>): boolean;
	function Size<T>(data: QueueStruct<T>): number;
}
