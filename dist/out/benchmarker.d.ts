export interface BenchmarkConfig {
    precision?: number;
    runIterations?: number;
    warmupIterations?: number;
}
export declare class Benchmarker {
    Precision: number;
    RunIterations: number;
    StoredFunctions: Record<string, () => void>;
    WarmupIterations: number;
    constructor(config?: BenchmarkConfig);
    RegisterFunction(name: string, func: () => void): void;
    RunAll(comparisonOrder?: Order): void;
    UnregisterFunction(name: string): void;
    private PrintResults;
    private ProcessRuntimes;
}
declare enum Order {
    Median = "Median",
    Max = "Max",
    Min = "Min"
}
export {};
