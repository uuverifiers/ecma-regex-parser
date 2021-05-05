#!/bin/sh

export CLASSPATH=lib/JLex.jar:lib/java-cup-11a.jar

bnfc -java -m ecma2020regex.cf
make ecma2020regex/Yylex.java ecma2020regex/sym.java ecma2020regex/parser.java

patch ecma2020regex/PrettyPrinter.java PP-patch
sed 's/PrettyPrinter/PrettyPrinterNonStatic/g' <ecma2020regex/PrettyPrinter.java | sed 's/static//g' >ecma2020regex/PrettyPrinterNonStatic.java

mvn deploy
