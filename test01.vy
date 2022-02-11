# @dev Vyper Implementation of the Ethereum Certificate Authorities Protocol
#      A decentralised smart-contract enabling provable trust

rootAuthority: public(address)

trustedOf: public(HashMap[address, address])

MAX_DEPTH: constant(uint256) = 255


@internal
@view
def _isAuthorised(addr: address, target: address) -> bool:
    _currentAddress: address = addr
    for i in range(MAX_DEPTH):
        if _currentAddress == target:
            return True
        _currentAddress = self.trustedOf[_currentAddress]
    return False


@external
def __init__():
    self.rootAuthority = msg.sender

@external
@view
def getDepth() -> uint256:
    return MAX_DEPTH

@external
@view
def isAuthorised(addr: address, target: address) -> bool:
    return self._isAuthorised(addr, target)

@external
@view
def isTrusted(addr: address) -> bool:
    return self._isAuthorised(addr, self.rootAuthority)


@external
@nonpayable
def authorise(_trustedAddress: address) -> bool:

    assert self._isAuthorised(msg.sender, self.rootAuthority)

    # make sure that the _trustedAddress is uninitialised
    # to prevent someone from maliciously modifing the trust structure
    assert self.trustedOf[_trustedAddress] == ZERO_ADDRESS 

    self.trustedOf[_trustedAddress] = msg.sender

    return True

@external
@nonpayable
def unauthorise(_trustedAddress: address) -> bool:

    assert self._isAuthorised(msg.sender, self.rootAuthority)

    assert self.trustedOf[_trustedAddress] == msg.sender

    self.trustedOf[_trustedAddress] = ZERO_ADDRESS

    return True

