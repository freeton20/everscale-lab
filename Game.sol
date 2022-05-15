pragma ton-solidity >=0.59.4;

contract Game {
	function getR() public view returns (uint8[]) {
		return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
	}
}
