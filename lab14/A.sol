pragma ton-solidity >= 0.47.0;

contract A {
    uint public static a;

    function changeStatic() public {
        tvm.accept();
        a = 7777777777777;
    }

}