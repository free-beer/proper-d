import std.stdio;
import properd;

void main() { 
   return;
}

unittest {
   import std.conv, std.exception;

   auto properties = readProperties(new File("./test.properties", "r"));

   assert(properties.length == 15);
   assert("first" in properties);
   assert("second" in properties);
   assert("third" in properties);
   assert("integer_0" in properties);
   assert("integer_1" in properties);
   assert("integer_123" in properties);
   assert("float_3.14" in properties);
   assert("bool_true" in properties);
   assert("bool_false" in properties);
   assert("bool_1" in properties);
   assert("bool_0" in properties);
   assert("bool_on" in properties);
   assert("bool_off" in properties);
   assert("bool_yes" in properties);
   assert("bool_no" in properties);

   assert(properties["first"] = "This is the first line.");
   assert(properties["second"] = "This is the second line.");
   assert(properties["third"] = "The third line that will have a value.");
   assert(properties["integer_0"] = "0");
   assert(properties["integer_1"] = "1");
   assert(properties["integer_123"] = "123");
   assert(properties["float_3.14"] = "3.14");
   assert(properties["bool_true"] = "true");
   assert(properties["bool_false"] = "false");
   assert(properties["bool_1"] = "1");
   assert(properties["bool_0"] = "0");
   assert(properties["bool_on"] = "On");
   assert(properties["bool_off"] = "Off");
   assert(properties["bool_yes"] = "Yes");
   assert(properties["bool_no"] = "No");

   assert(text(typeid(properties.as!(byte)("integer_123"))) == "byte");
   assert(text(typeid(properties.as!(ubyte)("integer_123"))) == "ubyte");
   assert(text(typeid(properties.as!(short)("integer_123"))) == "short");
   assert(text(typeid(properties.as!(ushort)("integer_123"))) == "ushort");
   assert(text(typeid(properties.as!(uint)("integer_123"))) == "uint");
   assert(text(typeid(properties.as!(int)("integer_123"))) == "int");
   assert(text(typeid(properties.as!(long)("integer_123"))) == "long");
   assert(text(typeid(properties.as!(float)("float_3.14"))) == "float");
   assert(text(typeid(properties.as!(double)("float_3.14"))) == "double");
   assert(text(typeid(properties.as!(real)("float_3.14"))) == "real");
   assert(text(typeid(properties.as!(bool)("bool_true"))) == "bool");

   assert(properties.as!(byte)("integer_0") == 0);
   assert(properties.as!(byte)("integer_1") == 1);
   assert(properties.as!(byte)("integer_123") == 123);

   assert(properties.as!(ubyte)("integer_0") == 0);
   assert(properties.as!(ubyte)("integer_1") == 1);
   assert(properties.as!(ubyte)("integer_123") == 123);

   assert(properties.as!(short)("integer_0") == 0);
   assert(properties.as!(short)("integer_1") == 1);
   assert(properties.as!(short)("integer_123") == 123);

   assert(properties.as!(ushort)("integer_0") == 0);
   assert(properties.as!(ushort)("integer_1") == 1);
   assert(properties.as!(ushort)("integer_123") == 123);

   assert(properties.as!(uint)("integer_0") == 0);
   assert(properties.as!(uint)("integer_1") == 1);
   assert(properties.as!(uint)("integer_123") == 123);

   assert(properties.as!(int)("integer_0") == 0);
   assert(properties.as!(int)("integer_1") == 1);
   assert(properties.as!(int)("integer_123") == 123);

   assert(properties.as!(long)("integer_0") == 0);
   assert(properties.as!(long)("integer_1") == 1);
   assert(properties.as!(long)("integer_123") == 123);

   assert(properties.as!(byte)("non_existent") == byte.init);
   assert(properties.as!(ubyte)("non_existent") == ubyte.init);
   assert(properties.as!(short)("non_existent") == short.init);
   assert(properties.as!(ushort)("non_existent") == ushort.init);
   assert(properties.as!(uint)("non_existent") == uint.init);
   assert(properties.as!(int)("non_existent") == int.init);
   assert(properties.as!(long)("non_existent") == long.init);
   assert(properties.as!(float)("non_existent") is float.init);
   assert(properties.as!(double)("non_existent") is double.init);
   assert(properties.as!(real)("non_existent") is real.init);

   assert(properties.as!(byte)("non_existent", -10) == -10);
   assert(properties.as!(ubyte)("non_existent", 10) == 10);
   assert(properties.as!(short)("non_existent", -50) == -50);
   assert(properties.as!(ushort)("non_existent", 50) == 50);
   assert(properties.as!(uint)("non_existent", 100) == 100);
   assert(properties.as!(int)("non_existent", 200) == 200);
   assert(properties.as!(long)("non_existent", 300) == 300);
   assert(properties.as!(float)("non_existent", 0.0) == 0.0);
   assert(properties.as!(double)("non_existent", 0.0) == 0.0);
   assert(properties.as!(real)("non_existent", 0.0) == 0.0);

   assert(properties.as!(bool)("bool_true") == true);
   assert(properties.as!(bool)("bool_false") == false);
   assert(properties.as!(bool)("bool_1") == true);
   assert(properties.as!(bool)("bool_0") == false);
   assert(properties.as!(bool)("bool_yes") == true);
   assert(properties.as!(bool)("bool_no") == false);
   assert(properties.as!(bool)("bool_on") == true);
   assert(properties.as!(bool)("bool_off") == false);
   assert(properties.as!(bool)("non_existent") == false);
   assert(properties.as!(bool)("non_existent", true) == true);

   assertThrown!(PropertyException)(readProperties("./does_not_exist.txt"));
   assertThrown!(PropertyException)(readProperties("./broken.cfg"));
   assertThrown!(PropertyException)(properties.as!(uint)("first"));

   writeln("*** UNIT TESTS COMPLETED SUCCESSFULLY.");
}
