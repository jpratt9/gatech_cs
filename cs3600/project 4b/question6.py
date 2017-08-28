import Testing
import NeuralNetUtil
import NeuralNet

print "----------------- testPenData --------------------"
numNeur = 0
while numNeur <= 40:
	print "--------------running with", numNeur, "neurons per hidden layer------------------"
	acclist = []
	for i in range(1, 6):
		print "running iteration", i, "..."
		nnet, testAcc = Testing.buildNeuralNet(Testing.penData, maxItr = 200, hiddenLayerList = [numNeur])
		acclist.append(testAcc)

	print "Finished"
	print "accuracy average:", Testing.average(acclist)
	print "accuracy standard deviation:", Testing.stDeviation(acclist)
	print "max accuracy:", max(acclist)
	numNeur += 5

print "----------------- testCarData --------------------"
numNeur = 0
while numNeur <= 40:
	print "--------------running with", numNeur , "neurons per hidden layer------------------"
	acclist = []
	for i in range(1, 6):
		print "running iteration", i, "..."
		nnet, testAcc = Testing.buildNeuralNet(Testing.carData, maxItr = 200, hiddenLayerList = [numNeur])
		acclist.append(testAcc)

	print "Finished"
	print "accuracy avg:", Testing.average(acclist)
	print "accuracy stdev:", Testing.stDeviation(acclist)
	print "accuracy max:", max(acclist)
	numNeur += 5
