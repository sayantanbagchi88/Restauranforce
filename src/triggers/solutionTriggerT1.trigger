trigger solutionTriggerT1 on Solution (before insert) {
	Trigger.new[0].SolutionNote ='<h1>hello</h1>';
}