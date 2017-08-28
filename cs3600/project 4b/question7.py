import Testing
import NeuralNetUtil
import NeuralNet

numNeur = 0
while 1:
	acclist = []
	print "--------------running with", numNeur , "neurons per hidden layer------------------"
	for i in range(1, 6):
		print "running iteration", i, "..."
		nnet, testAcc = NeuralNet.buildNeuralNet(Testing.xorData, maxItr = 200, hiddenLayerList = [numNeur])
		acclist.append(testAcc)

	print "Finished"
	print "accuracy avg:", Testing.average(acclist)
	print "accuracy stdev:", Testing.stDeviation(acclist)
	print "accuracy max:", max(acclist)
	if Testing.average(acclist) == 1:
		break
	numNeur += 1
