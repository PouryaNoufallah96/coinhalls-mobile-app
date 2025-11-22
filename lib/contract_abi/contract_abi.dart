import 'dart:convert';

import 'package:coin_hall/core/env.dart';
import 'package:web3dart/web3dart.dart';

class AppContractAbi {
  static DeployedContract get appContract {
    final contract = DeployedContract(
      ContractAbi.fromJson(jsonEncode(_appAbi), Env.appContractName),
      EthereumAddress.fromHex(Env.appContractAddress),
    );

    return contract;
  }

  static ContractFunction get batchSubmitGuesses {
    return appContract.function('batchSubmitGuesses');
  }

  static ContractFunction get batchUpdateGuess {
    return appContract.function('batchUpdateGuess');
  }

  static DeployedContract get insuranceContract {
    final contract = DeployedContract(
      ContractAbi.fromJson(jsonEncode(_insuranceAbi), Env.insuranceName),
      EthereumAddress.fromHex(Env.insuranceAddress),
    );

    return contract;
  }

  static ContractFunction get approveFunction {
    return insuranceContract.function('approve');
  }

  static final List<Map<String, Object>> _appAbi = [
    {
      'type': 'function',
      'name': 'batchSubmitGuesses',
      'inputs': [
        {'name': 'gameId', 'type': 'bytes32', 'internalType': 'bytes32'},
        {
          'name': 'predictedAmounts',
          'type': 'uint256[]',
          'internalType': 'uint256[]'
        }
      ],
      'outputs': [],
      'stateMutability': 'nonpayable'
    },
    {
      'type': 'function',
      'name': 'batchUpdateGuess',
      'inputs': [
        {'name': 'guessIds', 'type': 'bytes32[]', 'internalType': 'bytes32[]'},
        {
          'name': 'newPredictedAmounts',
          'type': 'uint256[]',
          'internalType': 'uint256[]'
        }
      ],
      'outputs': [],
      'stateMutability': 'nonpayable'
    },
    {
      'type': 'function',
      'name': 'defineGame',
      'inputs': [
        {'name': 'gameId', 'type': 'bytes32', 'internalType': 'bytes32'},
        {'name': 'tokenAddress', 'type': 'address', 'internalType': 'address'},
        {
          'name': 'targetPrizeInUsd',
          'type': 'uint256',
          'internalType': 'uint256'
        },
        {'name': 'startTime', 'type': 'uint64', 'internalType': 'uint64'},
        {'name': 'endTime', 'type': 'uint64', 'internalType': 'uint64'}
      ],
      'outputs': [],
      'stateMutability': 'nonpayable'
    },
    {
      'type': 'function',
      'name': 'submitGuess',
      'inputs': [
        {'name': 'gameId', 'type': 'bytes32', 'internalType': 'bytes32'},
        {
          'name': 'predictedAmount',
          'type': 'uint256',
          'internalType': 'uint256'
        }
      ],
      'outputs': [],
      'stateMutability': 'nonpayable'
    },
    {
      'type': 'event',
      'name': 'GameDefined',
      'inputs': [
        {
          'name': 'gameId',
          'type': 'bytes32',
          'indexed': false,
          'internalType': 'bytes32'
        },
        {
          'name': 'startTime',
          'type': 'uint256',
          'indexed': false,
          'internalType': 'uint256'
        },
        {
          'name': 'endTime',
          'type': 'uint256',
          'indexed': false,
          'internalType': 'uint256'
        }
      ],
      'anonymous': false
    },
    {
      'type': 'event',
      'name': 'GameFinalized',
      'inputs': [
        {
          'name': 'gameId',
          'type': 'bytes32',
          'indexed': false,
          'internalType': 'bytes32'
        },
        {
          'name': 'finalTokenPrice',
          'type': 'uint256',
          'indexed': false,
          'internalType': 'uint256'
        },
        {
          'name': 'finalPrizeValue',
          'type': 'uint256',
          'indexed': false,
          'internalType': 'uint256'
        },
        {
          'name': 'bestGuessId',
          'type': 'bytes32',
          'indexed': false,
          'internalType': 'bytes32'
        }
      ],
      'anonymous': false
    },
    {
      'type': 'event',
      'name': 'GuessSubmitted',
      'inputs': [
        {
          'name': 'gameId',
          'type': 'bytes32',
          'indexed': false,
          'internalType': 'bytes32'
        },
        {
          'name': 'guessId',
          'type': 'bytes32',
          'indexed': false,
          'internalType': 'bytes32'
        },
        {
          'name': 'player',
          'type': 'address',
          'indexed': false,
          'internalType': 'address'
        },
        {
          'name': 'predictedAmount',
          'type': 'uint256',
          'indexed': false,
          'internalType': 'uint256'
        },
        {
          'name': 'amountPaid',
          'type': 'uint256',
          'indexed': false,
          'internalType': 'uint256'
        }
      ],
      'anonymous': false
    },
    {
      'type': 'event',
      'name': 'GuessUpdated',
      'inputs': [
        {
          'name': 'guessId',
          'type': 'bytes32',
          'indexed': false,
          'internalType': 'bytes32'
        },
        {
          'name': 'player',
          'type': 'address',
          'indexed': false,
          'internalType': 'address'
        },
        {
          'name': 'newPredictedAmount',
          'type': 'uint256',
          'indexed': false,
          'internalType': 'uint256'
        }
      ],
      'anonymous': false
    }
  ];

  static final List<Map<String, Object>> approveAbi = [
    {
      'name': 'approve',
      'type': 'function',
      'stateMutability': 'nonpayable',
      'inputs': [
        {'name': 'spender', 'type': 'address'},
        {'name': 'amount', 'type': 'uint256'},
      ],
      'outputs': [],
    },
  ];

  static final List<Map<String, Object>> _insuranceAbi = [
    {
      'inputs': [],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'constructor'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'owner',
          'type': 'address'
        },
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'spender',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'value',
          'type': 'uint256'
        }
      ],
      'name': 'Approval',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'previousOwner',
          'type': 'address'
        },
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'newOwner',
          'type': 'address'
        }
      ],
      'name': 'OwnershipTransferred',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'from',
          'type': 'address'
        },
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'to',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'value',
          'type': 'uint256'
        }
      ],
      'name': 'Transfer',
      'type': 'event'
    },
    {
      'constant': true,
      'inputs': [
        {'internalType': 'address', 'name': 'owner', 'type': 'address'},
        {'internalType': 'address', 'name': 'spender', 'type': 'address'}
      ],
      'name': 'allowance',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'spender', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'amount', 'type': 'uint256'}
      ],
      'name': 'approve',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [
        {'internalType': 'address', 'name': 'account', 'type': 'address'}
      ],
      'name': 'balanceOf',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'decimals',
      'outputs': [
        {'internalType': 'uint8', 'name': '', 'type': 'uint8'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'spender', 'type': 'address'},
        {
          'internalType': 'uint256',
          'name': 'subtractedValue',
          'type': 'uint256'
        }
      ],
      'name': 'decreaseAllowance',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'getOwner',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'spender', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'addedValue', 'type': 'uint256'}
      ],
      'name': 'increaseAllowance',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'name',
      'outputs': [
        {'internalType': 'string', 'name': '', 'type': 'string'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'owner',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [],
      'name': 'renounceOwnership',
      'outputs': [],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'symbol',
      'outputs': [
        {'internalType': 'string', 'name': '', 'type': 'string'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'totalSupply',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'recipient', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'amount', 'type': 'uint256'}
      ],
      'name': 'transfer',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'sender', 'type': 'address'},
        {'internalType': 'address', 'name': 'recipient', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'amount', 'type': 'uint256'}
      ],
      'name': 'transferFrom',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'newOwner', 'type': 'address'}
      ],
      'name': 'transferOwnership',
      'outputs': [],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    }
  ];
}
