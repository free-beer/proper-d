# Proper-D

Proper-D is a simple library of functions for interacting with property files
(i.e. files that contain simple name value pairs). This is similar in nature
to the functionality offered by the java.util.Properties class in Java but with
a D twist. The library effectively provides a very basic file format for use as
things like of configuration files.

## Building

The library uses the [dub package manager](http://code.dlang.org/) so you will
need to install that. To build the unit tests for the library clone the
repository and, from the root directory of the repository copy, run this
command...

```
   dub build --build=unittest
```

Once this successfully completes there should be an executable created in the
same directory called proper-d.exe on Windows or proper-d on Linux. Run this
executable to execute the unit tests.

In terms of using the library the simplist thing to do is to copy the main
source file (source/proper-d.d) into your project. It has no dependencies beyond
elements of the D standard library.

## Usage

In Java the Properties class completely wraps the functionality for handling
property files but D provides associative arrays which would obviate the need
for a complete class. With this in mind the Proper-D code is worked around
creating associative arrays of strings indexed by strings. To make use of
Proper-D include the source file in your project and then import it into the
code to use it with a line such as...

```
   import properd;
```

Next you can either load a file of properties or provide a string that can be
parsed into an associative array. Some examples follow...

```
   // Load the ./examples.cfg file as a property file.
   auto properties = readProperties("./examples.cfg");

   // Same as before but specified via a File object.
   properties = readProperties(new File("./examples.cfg", "r"));

   // Parse a string of text into a property list.
   properties = parseProperties("first = One\nsecond = 2\nThird = 3.14");
```

All of the function calls shown above return associative arrays of type string
indexed by string (i.e. ```string[string]```). No interpretation of the data
is made but the library does provide an as() function that will attempt to
convert the values from an associative array to a specific type. The following
is an example of using this function...

```
   auto value1 = properties.as!(int)("second");
```

Here an attempt is made to convert the value indexed under the key "second" in
the associative array ```properties``` to an ```int```. If this fails then an
exception will be raised. A specialization of this template function is
provided for conversion of values to the bool type. This specialization will
recognise "true", "1", "on" and "yes" (test is case insensitive) as being a
boolean value of true. Anything else is false.

## License

Consult the license.txt file for licensing information.
