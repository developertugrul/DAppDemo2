// import Debug from base library in motoko to debug application
import Debug "mo:base/Debug";

// A simple demo of a class and object.
actor {

  // A variable of type String.
  var x = "Hello, world!";

  // A variable of type int.
  var y = 42;

  // Reassign the value of x.
  x := "Goodbye, world!";

  // Debug the value of x.
  //Debug.print(x);

  // Constant value. You can't reassign a constant !
  // let pi = 3.14159;
  // pi := 3.14; // This will not compile.

  // Debug the value of y. Note: y is an int, so we need to use debug_show method
  // Debug.print(debug_show(y));

  // Declare a function that increases the value of y by 1. Function expects a semicolon at the end ! This is a private function. It can only be called from within the class.
  public func increaseVariable()  {
    y += 1;
    Debug.print(debug_show(y));
  };

  // Call the function increaseVariable.
  // You can call this function from command line using "dfx canister call <canister_id> increaseVariable" . <canister_id> is the canister id of the canister that contains this class.
  // If you want to call this function from another class, you need to make it public!

  // dfx canister id __Candid_UI is the canister id of the canister that contains the Candid UI. http://127.0.0.1:8000/?canisterId=r7inp-6aaaa-aaaaa-aaabq-cai is the URL of the Candid UI.
  // When you go to http://127.0.0.1:8000/?canisterId=r7inp-6aaaa-aaaaa-aaabq-cai, you will see an input field where you can enter the canister id of the canister that contains this class. You can then call the increaseVariable function from the Candid UI.
  // Then type "dfx canister id <canister_name>" in the terminal to get the canister id of the canister that contains this class.
  // Then type the canister id in the input field of the Candid UI and click on the "Go" button. And then you can see Candid UI of the canister that contains this class.
  // You can then call the increaseVariable function from the Candid UI.
  
  // Declare a function multiply that takes two arguments of type int and prints the result of multiplying the two arguments. This is a public function. It can be called from outside the class.
  public func multiply(x : Nat, y : Nat) : async () {
    Debug.print(debug_show(x * y));
  };

  // Example

  // Declare a variable of type Nat.
  var currentBalance : Nat = 100;
  // Allow user to withdraw money from the currentBalance.
  public func withdraw(amount : Nat) : async () {
    // Check if the amount is less than or equal to the currentBalance. "if" is a keyword in Motoko. It is used to check if a condition is true or false. If the condition is true, then the code inside the "if" block is executed. If the condition is false, then the code inside the "if" block is not executed.
    if (amount <= currentBalance) { 
      // If the amount is less than or equal to the currentBalance, then subtract the amount from the currentBalance.
      currentBalance -= amount;
      // Print the currentBalance.
      Debug.print(debug_show(currentBalance));
    } else { // If the amount is greater than the currentBalance, then print "Insufficient balance". "else" is a keyword in Motoko. It is used to execute a block of code if the condition in the "if" block is false.
      // If the amount is greater than the currentBalance, then print "Insufficient balance".
      Debug.print("Insufficient balance");
    };
  };

  // Example 2

  public func withdrawl (amount:Nat){ // function withdrawl takes an argument of type Nat
    let newBalance : Int = currentBalance - amount; // subtract the amount from the currentBalance and assign the result to a variable newBalance of type Int, so that we can check if the newBalance is less than 0. If the newBalance is less than 0, then the amount is greater than the currentBalance.
    if (newBalance  >= 0 ) { // check if the newBalance is greater than or equal to 0. If the newBalance is greater than or equal to 0, then the amount is less than or equal to the currentBalance.
      currentBalance -= amount; // subtract the amount from the currentBalance.
      Debug.print(debug_show(currentBalance)); // print the currentBalance.
    } else { // if the newBalance is less than 0, then the amount is greater than the currentBalance. So print "Insufficient balance".
      Debug.print("Insufficient balance"); // print "Insufficient balance".
    };
  }
};