#! /usr/bin/env python

FILE_NAME = "C:\\Users\\olivi\\Desktop\\路径规划\\master-ipr-master\\map10\\map10.csv"
START_X = 3
START_Y = 15
END_X = 3
END_Y = 9


class Node:
    def __init__(self, x, y, myId, parentId):  # 这里myId和parentId具体是用来干什么的
        self.x = x
        self.y = y
        self.myId = myId
        self.parentId = parentId

    def dump(self):  # 这里不是很明白dump函数的意义
        print("---------- x " + str(self.x) + \
              " | y " + str(self.y) + \
              " | id " + str(self.myId) + \
              " | parentId " + str(self.parentId))


nodes = []

init = Node(START_X, START_Y, 0, -2)
# init.dump()

nodes.append(init)

charMap = []


def dumpMap():
    for line in charMap:
        print (line)


with open(FILE_NAME) as f:
    line = f.readline()
    while line:
        charLine = line.strip().split(',')
        charMap.append(charLine)
        line = f.readline()

charMap[START_X][START_Y] = '3'
charMap[END_X][END_Y] = '4'

dumpMap()

done = False
goalParentId = -1

while not done:
    print("--------------------- number of nodes: " + str(len(nodes)))
    for node in nodes:
        node.dump()

        # up
        tmpX = node.x - 1  # 为什么往上是减：行数往上是减，列数往左是减
        tmpY = node.y
        if (charMap[tmpX][tmpY] == '4'):
            print("up: GOALLLL!!!")
            goalParentId = node.myId
            done = True
            break
        elif (charMap[tmpX][tmpY] == '0'):  # 这里不能用else,因为 ‘1’ 墙壁会出错
            print("up: mark visited")
            newNode = Node(tmpX, tmpY, len(nodes), node.myId)
            charMap[tmpX][tmpY] = '2'
            nodes.append(newNode)

        # down
        tmpX = node.x + 1
        tmpY = node.y
        if (charMap[tmpX][tmpY] == '4'):
            print("down: GOALLLL!!!")
            goalParentId = node.myId
            done = True
            break
        elif (charMap[tmpX][tmpY] == '0'):
            print("down: mark visited")
            newNode = Node(tmpX, tmpY, len(nodes), node.myId)
            charMap[tmpX][tmpY] = '2'
            nodes.append(newNode)

        # right
        tmpX = node.x
        tmpY = node.y + 1
        if (charMap[tmpX][tmpY] == '4'):
            print("right: GOALLLL!!!")
            goalParentId = node.myId
            done = True
            break
        elif (charMap[tmpX][tmpY] == '0'):
            print("right    : mark visited")
            newNode = Node(tmpX, tmpY, len(nodes), node.myId)
            charMap[tmpX][tmpY] = '2'
            nodes.append(newNode)

        # left
        tmpX = node.x
        tmpY = node.y - 1
        if (charMap[tmpX][tmpY] == '4'):
            print("left: GOALLLL!!!")
            goalParentId = node.myId
            done = True
            break
        elif (charMap[tmpX][tmpY] == '0'):
            print("left: mark visited")
            newNode = Node(tmpX, tmpY, len(nodes), node.myId)
            charMap[tmpX][tmpY] = '2'
            nodes.append(newNode)

        dumpMap()

print("%%%%%%%%%%%%%%%%%%%")
ok = False
while not ok:
    for node in nodes:
        if (node.myId == goalParentId):
            node.dump()
            goalParentId = node.parentId
            if (goalParentId == -2):
                print("%%%%%%%%%%%%%%%%%2")
                ok = True
