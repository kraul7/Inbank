This the MVP on Inbank's iOS Assignemtn by Raul Kuusik

The app consists of 2 modules, one for the loan application process and another for the result.

Carthage is used as a package manager. For simplification, all Carthage files are added to the git. In a real project, it's better not to do this.

PureLayout is a depenceny framework, used to help making the constraints more easy to write & read.

TODOS:
1) finish with the tests
2) Implement 
	2.1) generate project files by xcodegen - to make those project file merge conflicts to go away
	2.2) swiftlint - to keep it linear accross the team
	2.3) strings localization - to keep it clean & to be able to easily translate the app
	2.4) schemas & configuration support for different "App flavours" i.e testing & production
