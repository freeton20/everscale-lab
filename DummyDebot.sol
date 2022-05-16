pragma ton-solidity >=0.59.4;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;
import "https://raw.githubusercontent.com/tonlabs/debots/main/Debot.sol";
import "https://raw.githubusercontent.com/tonlabs/DeBot-IS-consortium/main/Terminal/Terminal.sol";

interface IGame {
	function getR() external returns (uint8[]);
}

contract DummyDebot is Debot {
	function start() public override {
		address gameAddress1 = address.makeAddrStd(
			0,
			0xe21ff1d477fb0fd84108d1f3c1af3bbe37c0972b4352d966c74cb7186d881e4c
		);
		IGame(gameAddress1).getR{
			time: 0,
			expire: 0,
			sign: false,
			callbackId: tvm.functionId(AnswerCallback),
			onErrorId: tvm.functionId(ErrorCallback)
		}().extMsg;
	}

	function AnswerCallback(uint8[] i) public {
		for (uint256 index = 0; index < i.length; index++) {
			Terminal.print(0, format("{}", i[index]));
		}
	}

	function ErrorCallback(uint32 sdkError, uint32 exitCode) public {
		Terminal.print(
			0,
			format("SdkError: {}, exitCode: {}", sdkError, exitCode)
		);
	}

	function getDebotInfo()
		public
		view
		override
		functionID(0xDEB)
		returns (
			string name,
			string version,
			string publisher,
			string key,
			string author,
			address support,
			string hello,
			string language,
			string dabi,
			bytes icon
		)
	{
		name = "Test DeBot";
		version = "0.0.1";
		publisher = "publisher name";
		key = "How to use";
		author = "Author name";
		support = address.makeAddrStd(
			0,
			0x000000000000000000000000000000000000000000000000000000000000
		);
		hello = "Hello, i am an test DeBot.";
		language = "en";
		dabi = m_debotAbi.get();
		icon = "";
	}

	function getRequiredInterfaces()
		public
		view
		override
		returns (uint256[] interfaces)
	{
		return [Terminal.ID];
	}
}
