trigger triggerSolutionT2 on Solution (before insert) {
	Trigger.new[0].SolutionNote ='<javascript>Hello</javascript>Goodbye';
}