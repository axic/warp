import { Command } from 'commander';
import { isValidSolFile, outputResult } from './io';
import { compileSolFile } from './solCompile';
import { handleTranspilationError, transform, transpile } from './transpiler';
import { analyseSol } from './utils/analyseSol';
import {
  runStarknetCallOrInvoke,
  runStarknetCompile,
  runStarknetDeploy,
  runStarknetDeployAccount,
  runStarknetStatus,
} from './starknetCli';
import chalk from 'chalk';
import { runVenvSetup } from './utils/setupVenv';
import { runTests } from './testing';

export type CompilationOptions = {
  warnings: boolean;
};

export type TranspilationOptions = {
  checkTrees?: boolean;
  order?: string;
  printTrees?: boolean;
  strict?: boolean;
  until?: string;
};

export type PrintOptions = {
  highlight?: string[];
  stubs?: boolean;
};

export type OutputOptions = {
  compileCairo?: boolean;
  compileErrors?: boolean;
  outputDir?: string;
  result: boolean;
};

type CliOptions = CompilationOptions & TranspilationOptions & PrintOptions & OutputOptions;

const program = new Command();

program
  .command('transpile <file>')
  .option('--compile-cairo')
  .option('--no-compile-errors')
  .option('--check-trees')
  .option('--highlight <ids...>')
  .option('--order <passOrder>')
  .option('-o, --output-dir <path>', undefined, 'warp_output')
  .option('--print-trees')
  .option('--no-result')
  .option('--no-stubs')
  .option('--no-strict')
  // Stops transpilation after the specified pass
  .option('--until <pass>')
  .option('--no-warnings')
  .action((file: string, options: CliOptions) => {
    if (!isValidSolFile(file)) return;
    try {
      transpile(compileSolFile(file, options.warnings), options).map(([name, cairo, abi]) => {
        outputResult(name, cairo, options, '.cairo', abi);
      });
    } catch (e) {
      handleTranspilationError(e);
    }
  });

program
  .command('transform <file>')
  .option('--no-compile-errors')
  .option('--check-trees')
  .option('--highlight <ids...>')
  .option('--order <passOrder>')
  .option('-o, --output-dir <path>')
  .option('--print-trees')
  .option('--no-result')
  .option('--no-stubs')
  .option('--no-strict')
  .option('--until <pass>')
  .option('--no-warnings')
  .action((file: string, options: CliOptions) => {
    if (!isValidSolFile(file)) return;
    try {
      transform(compileSolFile(file, options.warnings), options).map(([name, solidity, _]) => {
        outputResult(name, solidity, options, '_warp.sol');
      });
    } catch (e) {
      handleTranspilationError(e);
    }
  });

program
  .command('test')
  .option('-f --force')
  .option('-r --results')
  .option('-u --unsafe')
  .option('-e --exact')
  .action((options) =>
    runTests(
      options.force ?? false,
      options.results ?? false,
      options.unsafe ?? false,
      options.exact ?? false,
    ),
  );

program
  .command('analyse <file>')
  .option('--highlight <ids...>')
  .action((file: string, options: PrintOptions) => analyseSol(file, options));

export interface IOptionalNetwork {
  network?: string;
}

program
  .command('status <tx_hash>')
  .option('--network <network>', 'Starknet network URL.', process.env.STARKNET_NETWORK)
  .action((tx_hash: string, options: IOptionalNetwork) => {
    runStarknetStatus(tx_hash, options);
  });

interface IDeployProps_ {
  inputs?: string;
  use_cairo_abi: boolean;
}
export type IDeployProps = IDeployProps_ & IOptionalNetwork & IOptionalAccount;

program
  .command('deploy <file>')
  .option(
    '--inputs <inputs>',
    'Arguments to be passed to constructor of the program as a comma seperated list of strings, ints and lists.',
    undefined,
  )
  .option('--use_cairo_abi', 'Use the cairo abi instead of solidity for the inputs.', false)
  .option('--network <network>', 'Starknet network URL', process.env.STARKNET_NETWORK)
  .action((file: string, options: IDeployProps) => {
    runStarknetDeploy(file, options);
  });

interface IOptionalWallet {
  wallet?: string;
}

interface IOptionalAccount {
  account?: string;
}
export type IDeployAccountProps = IOptionalAccount & IOptionalNetwork & IOptionalWallet;

program
  .command('deploy_account')
  .option(
    '--account <account>',
    'The name of the account. If not given, the default for the wallet will be used.',
  )
  .option('--network <network>', 'Starknet network URL.', process.env.STARKNET_NETWORK)
  .option(
    '--wallet <wallet>',
    'The name of the wallet, including the python module and wallet class.',
    process.env.STARKNET_WALLET,
  )
  .action((options: IDeployAccountProps) => {
    runStarknetDeployAccount(options);
  });

interface ICallOrInvokeProps_ {
  address: string;
  function: string;
  inputs?: string;
  use_cairo_abi: boolean;
}
export type ICallOrInvokeProps = ICallOrInvokeProps_ &
  IOptionalNetwork &
  IOptionalWallet &
  IOptionalAccount;

program
  .command('invoke <file>')
  .requiredOption('--address <address>', 'Address of contract to invoke.')
  .requiredOption('--function <function>', 'Function to invoke.')
  .option(
    '--inputs <inputs>',
    'Input to function as a comma separated string, use square brackets to represent lists and structs. Numbers can be represented in decimal and hex.',
    undefined,
  )
  .option('--use_cairo_abi', 'Use the cairo abi instead of solidity for the inputs.', false)
  .option(
    '--account <account>',
    'The name of the account. If not given, the default for the wallet will be used.',
  )
  .option('--network <network>', 'Starknet network URL.', process.env.STARKNET_NETWORK)
  .option(
    '--wallet <wallet>',
    'The name of the wallet, including the python module and wallet class.',
    process.env.STARKNET_WALLET,
  )
  .action(async (file: string, options: ICallOrInvokeProps) => {
    runStarknetCallOrInvoke(file, false, options);
  });

program
  .command('call <file>')
  .requiredOption('--address <address>', 'Address of contract to call.')
  .requiredOption('--function <function>', 'Function to call.')
  .option(
    '--inputs <inputs>',
    'Input to function as a comma separated string, use square brackets to represent lists and structs. Numbers can be represented in decimal and hex.',
    undefined,
  )
  .option('--use_cairo_abi', 'Use the cairo abi instead of solidity for the inputs.', false)
  .option(
    '--account <account>',
    'The name of the account. If not given, the default for the wallet will be used.',
  )
  .option('--network <network>', 'Starknet network URL.', process.env.STARKNET_NETWORK)
  .option(
    '--wallet <wallet>',
    'The name of the wallet, including the python module and wallet class.',
    process.env.STARKNET_WALLET,
  )
  .action(async (file: string, options: ICallOrInvokeProps) => {
    runStarknetCallOrInvoke(file, true, options);
  });

interface IOptionalVerbose {
  verbose: boolean;
}

interface IInstallOptions_ {
  python: string;
}

export type IInstallOptions = IInstallOptions_ & IOptionalVerbose;

program
  .command('install')
  .option('--python <python>', 'Path to python3.7 executable.', 'python3.7')
  .option('-v, --verbose')
  .action((options: IInstallOptions) => {
    runVenvSetup(options);
  });

program.command('compile <file>').action((file: string) => {
  runStarknetCompile(file);
});

const blue = chalk.bold.blue;
const green = chalk.bold.green;
program.command('version').action(() => {
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  const pjson = require('../package.json');
  console.log(blue(`Warp Version `) + green(pjson.version));
});

program.parse(process.argv);
