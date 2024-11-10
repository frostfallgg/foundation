import { Math } from "./native/math";

export interface BenchmarkConfig {
	precision?: number;
	runIterations?: number;
	warmupIterations?: number;
}

interface BenchmarkResult {
	[Order.Max]: number;
	[Order.Median]: number;
	[Order.Min]: number;
	name: string;
}

export class Benchmarker {
	Precision: number;
	RunIterations: number;
	StoredFunctions: Record<string, () => void>;
	WarmupIterations: number;

	constructor(config?: BenchmarkConfig) {
		const compiledConfig: Required<BenchmarkConfig> = { ...DEFAULT_CONFIG, ...config };
		this.Precision = compiledConfig.precision;
		this.RunIterations = compiledConfig.runIterations;
		this.WarmupIterations = compiledConfig.warmupIterations;
		this.StoredFunctions = {};
	}

	RegisterFunction(name: string, func: () => void) {
		this.StoredFunctions[name] = func;
	}

	RunAll(comparisonOrder: Order = Order.Median) {
		const results: BenchmarkResult[] = [];
		for (const [name, func] of pairs(this.StoredFunctions)) {
			const runtimes: number[] = [];
			for (let i = 0; i < this.WarmupIterations; i++) {
				func();
			}
			for (let i = 0; i < this.RunIterations; i++) {
				const start = os.clock();
				func();
				runtimes.push(os.clock() - start);
			}
			results.push(this.ProcessRuntimes(name, runtimes));
		}
		this.PrintResults(results, comparisonOrder);
	}

	UnregisterFunction(name: string) {
		delete this.StoredFunctions[name];
	}

	private PrintResults(results: BenchmarkResult[], order: Order) {
		table.sort(results, (a, b) => a[order] < b[order]);

		const getOuput = (result: BenchmarkResult) => {
			const medianOutput = string.format(`%s: %.${this.Precision}fms`, result[Order.Median]);
			const maxOutput = string.format(`%s: %.${this.Precision}fms`, result[Order.Max]);
			const minOutput = string.format(`%s: %.${this.Precision}fms`, result[Order.Min]);
			return $tuple(medianOutput, maxOutput, minOutput);
		};

		for (let i = 0; i < results.size(); i++) {
			const result = results[i];
			const [medianOutput, maxOutput, minOutput] = getOuput(result);

			if (i > 1) {
				const fasterResult = results[i - 1];
				const percentageFaster = ((result[order] - fasterResult[order]) / fasterResult[order]) * 100;
				print(
					`${i + 1}: ${result.name} - ${string.format("%.2f%%", percentageFaster)} then ${fasterResult.name} (${order})`,
				);
				print(`[Median: ${medianOutput}], [Max: ${maxOutput}], [Min: ${minOutput}]`);
			} else {
				print(`${i + 1}: ${result.name}`);
				print(`[Median: ${medianOutput}], [Max: ${maxOutput}], [Min: ${minOutput}]`);
			}
		}
	}

	private ProcessRuntimes(name: string, runtimes: number[]): BenchmarkResult {
		table.sort(runtimes, (a, b) => a < b);
		const result: BenchmarkResult = {
			[Order.Max]: runtimes[runtimes.size() - 1],
			[Order.Median]: Math.Median(runtimes),
			[Order.Min]: runtimes[0],
			name: name,
		};
		return result;
	}
}

enum Order {
	Median = "Median",
	Max = "Max",
	Min = "Min",
}

const DEFAULT_CONFIG = {
	precision: 10,
	runIterations: 10,
	warmupIterations: 5,
};
