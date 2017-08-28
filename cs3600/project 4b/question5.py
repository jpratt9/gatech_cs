import Testing
import NeuralNetUtil
import NeuralNet

print "----------------- testPenData --------------------"
acclist = []
for i in range(1, 6):
	print "running iteration", i, "..."
	nnet, testAcc = Testing.testPenData()
	acclist.append(testAcc)
	i += 1

print "Finished"
print "accuracy avg:", Testing.average(acclist)
print "accuracy stdev:", Testing.stDeviation(acclist)
print "accuracy max:", max(acclist)

print "----------------- testCarData --------------------"
acclist = []
for i in range(1, 6):
	print "running iteration", i, "..."
	nnet, testAcc = Testing.testCarData()
	acclist.append(testAcc)
	i += 1

print "Finished"
print "accuracy avg:", Testing.average(acclist)
print "accuracy stdev:", Testing.stDeviation(acclist)
print "accuracy max:", max(acclist)
