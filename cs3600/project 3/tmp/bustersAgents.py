
        localMax = []
        goalCoord = None
        goalProb = 0
        for belief in livingGhostPositionDistributions:
            localMax.append(belief.argMax())

        for i, coord in enumerate(localMax):
            if goalProb < livingGhostPositionDistributions[i][coord]:
                goalCoord, goalProb = coord, livingGhostPositionDistributions[i][coord]

        temp = []
        for action in legal:
            nextLocation = Actions.getSuccessor(pacmanPosition, action)
            temp.append((self.distancer.getDistance(nextLocation, goalCoord), action))
        return min(temp)[1]
