FILE_NAME = "C:\\Users\\olivi\\Desktop\\路径规划\\master-ipr-master\\map10\\map10.csv"
START_X = int(input('Enter the starting line：'))
START_Y = int(input('Enter the starting column：'))
END_X = int(input('Enter the end line：'))
END_Y = int(input('Enter the end column：'))
path_map = []


def load_map():
    for line in path_map:
        print(line)


with open(FILE_NAME) as f:
    line = f.readline()
    while line:
        path_line = line.strip().split(',')
        path_map.append(path_line)
        line = f.readline()


path_map[START_X][START_Y] = '2'
path_map[END_X][END_Y] = '4'
load_map()
paso_final = []


def DFS_search(x, y):
    if path_map[x][y] == '4':
        print('found at %d,%d' % (x, y))
        paso_final.append((x, y))
        print(paso_final)
        load_map()
        return True
    elif path_map[x][y] == '1':
        print('wall at %d,%d' % (x, y))
        load_map()
        return False
    elif path_map[x][y] == '3':
        print('visited at %d,%d' % (x, y))
        load_map()
        return False

    print('visiting %d,%d' % (x, y))

    paso_final.append((x, y))
    # mark as visited
    path_map[x][y] = '3'
    load_map()
    # explore neighbors clockwise starting by the one on the right
    if ((x < len(path_map) - 1 and DFS_search(x + 1, y))
            or (y > 0 and DFS_search(x, y - 1))
            or (x > 0 and DFS_search(x - 1, y))
            or (y < len(path_map) - 1 and DFS_search(x, y + 1))):
        return True

    return False

DFS_search(START_X, START_Y)