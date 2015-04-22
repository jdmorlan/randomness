# IR Quotes Project

## Sub-Project: IR Quotes User Interface (IRQ-UI)

The front-end tool that allows users to create quotes, and upload them to our
SharePoint server in their final format (PDF).

The prototype version will be built in [Atom Shell](https://github.com/atom/atom-shell),
which uses web-technologies to build a desktop based application. I choose Atom Shell,
since it is a large open-source project that is backed by Github, and a large
community. Atom Shell is very modular, and there are already nice standard
packages for doing things such as auto-updating, etc.

The UI will mostly manipulate a JSON file that contains all the dynamic data
that is needed to create a quote from a standard template. There will also
have to be some views that allow users to save information to the SharePoint
server.

## Sub-Project: IR Quotes Compiler - (IRQ-Compiler)

Programming Language: Ruby

The compiler takes a quote-manifest file, and converts it into a object-model
that other projects within the IR Quotes Project can use. It takes the basic
information from the quote-manifest file, and puts it into a more programmer
friendly format, as well as doing additional lookups for standard information,
such as current pricing, etc.

The output of the compiler is a set of artifacts, or a full `Quote` object that
contains all the information needed to build a quote from a standard template.

## Sub-Project: IR Quotes Generator - (IRQ-Generator)

Programming Language: Ruby
