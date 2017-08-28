        localMax = []
        for belief in livingGhostPositionDistributions:
            localMax.append(belief.argMax())
        goalCoordinate, goalProbability = None, 0
        for index, coordinate in enumerate(localMax):
            if livingGhostPositionDistributions[index][coordinate] >= goalProbability:
                goalCoordinate, goalProbability = coordinate, livingGhostPositionDistributions[index][coordinate]

        temp = []
        for action in legal:
            nextLocation = Actions.getSuccessor(pacmanPosition, action)
            temp.append((self.distancer.getDistance(nextLocation, goalCoordinate), action))
        return min(temp)[1]


        # util.raiseNotDefined()
