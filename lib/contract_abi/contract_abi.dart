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

  static ContractFunction get insureTokenFunction {
    return appContract.function('insureToken');
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
      'inputs': [
        {'internalType': 'address', 'name': 'initialOwner', 'type': 'address'},
        {'internalType': 'address', 'name': 'operatorAddr', 'type': 'address'},
        {
          'internalType': 'address',
          'name': 'insuranceTokenAddr',
          'type': 'address'
        },
        {'internalType': 'address', 'name': 'rzusdAddr', 'type': 'address'},
        {'internalType': 'address', 'name': 'priceFeedAddr', 'type': 'address'},
        {'internalType': 'address', 'name': 'treasuryAddr', 'type': 'address'}
      ],
      'stateMutability': 'nonpayable',
      'type': 'constructor'
    },
    {'inputs': [], 'name': 'ECDSAInvalidSignature', 'type': 'error'},
    {
      'inputs': [
        {'internalType': 'uint256', 'name': 'length', 'type': 'uint256'}
      ],
      'name': 'ECDSAInvalidSignatureLength',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'bytes32', 'name': 's', 'type': 'bytes32'}
      ],
      'name': 'ECDSAInvalidSignatureS',
      'type': 'error'
    },
    {'inputs': [], 'name': 'EnforcedPause', 'type': 'error'},
    {'inputs': [], 'name': 'ExpectedPause', 'type': 'error'},
    {'inputs': [], 'name': 'InsufficientBalance', 'type': 'error'},
    {'inputs': [], 'name': 'InsuranceAlreadyExists', 'type': 'error'},
    {'inputs': [], 'name': 'InsuranceNotEnded', 'type': 'error'},
    {'inputs': [], 'name': 'InvalidDates', 'type': 'error'},
    {'inputs': [], 'name': 'InvalidShortString', 'type': 'error'},
    {'inputs': [], 'name': 'NoExcessBalance', 'type': 'error'},
    {'inputs': [], 'name': 'NotActiveInsurance', 'type': 'error'},
    {'inputs': [], 'name': 'OnlyOperator', 'type': 'error'},
    {
      'inputs': [
        {'internalType': 'address', 'name': 'owner', 'type': 'address'}
      ],
      'name': 'OwnableInvalidOwner',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'account', 'type': 'address'}
      ],
      'name': 'OwnableUnauthorizedAccount',
      'type': 'error'
    },
    {'inputs': [], 'name': 'PriceOverflow', 'type': 'error'},
    {'inputs': [], 'name': 'ReentrancyGuardReentrantCall', 'type': 'error'},
    {
      'inputs': [
        {'internalType': 'address', 'name': 'token', 'type': 'address'}
      ],
      'name': 'SafeERC20FailedOperation',
      'type': 'error'
    },
    {'inputs': [], 'name': 'SignatureExpired', 'type': 'error'},
    {
      'inputs': [
        {'internalType': 'string', 'name': 'str', 'type': 'string'}
      ],
      'name': 'StringTooLong',
      'type': 'error'
    },
    {'inputs': [], 'name': 'Unauthorized', 'type': 'error'},
    {'inputs': [], 'name': 'UserHasEnoughBalance', 'type': 'error'},
    {'inputs': [], 'name': 'ZeroAddress', 'type': 'error'},
    {'inputs': [], 'name': 'ZeroCoverageAmount', 'type': 'error'},
    {'inputs': [], 'name': 'ZeroInsuredToken', 'type': 'error'},
    {
      'anonymous': false,
      'inputs': [],
      'name': 'EIP712DomainChanged',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'bytes32',
          'name': 'insuranceId',
          'type': 'bytes32'
        },
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'user',
          'type': 'address'
        }
      ],
      'name': 'InsuranceCancelled',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'bytes32',
          'name': 'insuranceId',
          'type': 'bytes32'
        },
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'user',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'settlementAmount',
          'type': 'uint256'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'finalPrice',
          'type': 'uint256'
        },
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'payoutToken',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'payoutAmount',
          'type': 'uint256'
        }
      ],
      'name': 'InsuranceFinalized',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'bytes32',
          'name': 'insuranceId',
          'type': 'bytes32'
        },
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'user',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'insuredToken',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'coverageAmount',
          'type': 'uint256'
        }
      ],
      'name': 'InsuranceRegistered',
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
          'indexed': false,
          'internalType': 'address',
          'name': 'account',
          'type': 'address'
        }
      ],
      'name': 'Paused',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'account',
          'type': 'address'
        }
      ],
      'name': 'Unpaused',
      'type': 'event'
    },
    {
      'inputs': [],
      'name': 'REGISTER_INSURANCE_TYPEHASH',
      'outputs': [
        {'internalType': 'bytes32', 'name': '', 'type': 'bytes32'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {
          'internalType': 'bytes32[]',
          'name': 'insuranceIds',
          'type': 'bytes32[]'
        }
      ],
      'name': 'batchLiquidateInsurances',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'eip712Domain',
      'outputs': [
        {'internalType': 'bytes1', 'name': 'fields', 'type': 'bytes1'},
        {'internalType': 'string', 'name': 'name', 'type': 'string'},
        {'internalType': 'string', 'name': 'version', 'type': 'string'},
        {'internalType': 'uint256', 'name': 'chainId', 'type': 'uint256'},
        {
          'internalType': 'address',
          'name': 'verifyingContract',
          'type': 'address'
        },
        {'internalType': 'bytes32', 'name': 'salt', 'type': 'bytes32'},
        {'internalType': 'uint256[]', 'name': 'extensions', 'type': 'uint256[]'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'bytes32', 'name': 'insuranceId', 'type': 'bytes32'}
      ],
      'name': 'finalizeInsurance',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'bytes32', 'name': 'insuranceId', 'type': 'bytes32'}
      ],
      'name': 'getInsurance',
      'outputs': [
        {
          'components': [
            {
              'internalType': 'uint128',
              'name': 'payoutAmount',
              'type': 'uint128'
            },
            {
              'internalType': 'uint128',
              'name': 'payoutAmountInUsd',
              'type': 'uint128'
            },
            {
              'internalType': 'uint256',
              'name': 'coverageAmount',
              'type': 'uint256'
            },
            {'internalType': 'uint64', 'name': 'initalPrice', 'type': 'uint64'},
            {'internalType': 'uint64', 'name': 'finalPrice', 'type': 'uint64'},
            {'internalType': 'uint64', 'name': 'startDate', 'type': 'uint64'},
            {'internalType': 'uint64', 'name': 'endDate', 'type': 'uint64'},
            {
              'internalType': 'address',
              'name': 'insuredToken',
              'type': 'address'
            },
            {'internalType': 'address', 'name': 'user', 'type': 'address'},
            {
              'internalType': 'enum ShieldStorage.InsuranceType',
              'name': 'insuranceType',
              'type': 'uint8'
            },
            {
              'internalType': 'enum ShieldStorage.InsuranceStatus',
              'name': 'status',
              'type': 'uint8'
            }
          ],
          'internalType': 'struct ShieldStorage.Insurance',
          'name': '',
          'type': 'tuple'
        }
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'insurancePaymentToken',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'bytes32', 'name': '', 'type': 'bytes32'}
      ],
      'name': 'insurances',
      'outputs': [
        {'internalType': 'uint128', 'name': 'payoutAmount', 'type': 'uint128'},
        {
          'internalType': 'uint128',
          'name': 'payoutAmountInUsd',
          'type': 'uint128'
        },
        {
          'internalType': 'uint256',
          'name': 'coverageAmount',
          'type': 'uint256'
        },
        {'internalType': 'uint64', 'name': 'initalPrice', 'type': 'uint64'},
        {'internalType': 'uint64', 'name': 'finalPrice', 'type': 'uint64'},
        {'internalType': 'uint64', 'name': 'startDate', 'type': 'uint64'},
        {'internalType': 'uint64', 'name': 'endDate', 'type': 'uint64'},
        {'internalType': 'address', 'name': 'insuredToken', 'type': 'address'},
        {'internalType': 'address', 'name': 'user', 'type': 'address'},
        {
          'internalType': 'enum ShieldStorage.InsuranceType',
          'name': 'insuranceType',
          'type': 'uint8'
        },
        {
          'internalType': 'enum ShieldStorage.InsuranceStatus',
          'name': 'status',
          'type': 'uint8'
        }
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {
          'components': [
            {
              'internalType': 'uint128',
              'name': 'payoutAmount',
              'type': 'uint128'
            },
            {
              'internalType': 'uint128',
              'name': 'payoutAmountInUsd',
              'type': 'uint128'
            },
            {
              'internalType': 'uint256',
              'name': 'coverageAmount',
              'type': 'uint256'
            },
            {'internalType': 'uint64', 'name': 'startDate', 'type': 'uint64'},
            {'internalType': 'uint64', 'name': 'endDate', 'type': 'uint64'},
            {'internalType': 'uint64', 'name': 'initalPrice', 'type': 'uint64'},
            {'internalType': 'uint64', 'name': 'sigDeadline', 'type': 'uint64'},
            {
              'internalType': 'address',
              'name': 'insuredToken',
              'type': 'address'
            },
            {'internalType': 'address', 'name': 'user', 'type': 'address'},
            {
              'internalType': 'enum ShieldStorage.InsuranceType',
              'name': 'insuranceType',
              'type': 'uint8'
            }
          ],
          'internalType': 'struct ShieldStorage.RegisterInsuranceParams',
          'name': 'params',
          'type': 'tuple'
        },
        {'internalType': 'bytes', 'name': 'signature', 'type': 'bytes'}
      ],
      'name': 'insureToken',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'bytes32', 'name': 'insuranceId', 'type': 'bytes32'}
      ],
      'name': 'liquidateInsurance',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'user', 'type': 'address'}
      ],
      'name': 'nonces',
      'outputs': [
        {'internalType': 'uint256', 'name': 'nonce', 'type': 'uint256'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'operator',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'owner',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'pause',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'paused',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'priceFeed',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'token', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'amount', 'type': 'uint256'}
      ],
      'name': 'refundAdmin',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'renounceOwnership',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'rzusdToken',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': '_newOperator', 'type': 'address'}
      ],
      'name': 'setOperator',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'priceFeedAddr', 'type': 'address'}
      ],
      'name': 'setPriceFeedAddress',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'treasuryAddr', 'type': 'address'}
      ],
      'name': 'setTreasuryAddress',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'totalReservedInsurance',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'totalReservedRzusd',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'newOwner', 'type': 'address'}
      ],
      'name': 'transferOwnership',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'treasury',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'unpause',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    }
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
