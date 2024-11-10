type ObjectLike<K, V> = Record<string | number | symbol, V> | Map<K, V>;

export declare namespace HashMap {
	function GetArbitraryKey<T extends ObjectLike<K, V>, K, V>(obj: T): T extends Map<infer K, V> ? K : keyof T;
	function GetArbitraryValue<T extends ObjectLike<K, V>, K, V>(
		obj: T,
	): T extends Map<K, infer V> ? V : T[keyof T];
}
