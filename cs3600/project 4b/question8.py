import Testing
import NeuralNetUtil
import NeuralNet

acclist = []
for i in range(1, 6):
	print "running iteration", i, "..."
	nnet, testAcc = Testing.testExtraData()
	acclist.append(testAcc)

print "Finished"
print "accuracy avg:", Testing.average(acclist)
print "accuracy stdev:", Testing.stDeviation(acclist)
print "accuracy max:", max(acclist)
