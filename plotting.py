import matplotlib.pyplot as plt
import numpy as np

def plot_scatter(x, y, x_label, y_label, title):
    plt.scatter(x, y)
    plt.xlabel(x_label)
    plt.ylabel(y_label)
    plt.title(title)
    plt.show()

def plot_bar(rows, x_label, y_label, title, rotation = None):
    unzipped = list(zip(*rows))
    x = list(unzipped[0])
    y = list(unzipped[1])

    ax = plt.subplot()

    plt.bar(x, y)
    if rotation is not None:
        ax.set_xticklabels(x, rotation = rotation)
    else:
        plt.xlabel(x_label)
    plt.ylabel(y_label)
    plt.title(title)
    plt.show()

def plot_3d(rows):
    unzipped = list(zip(*rows))

    xVal = list(unzipped[0])
    yVal = list(unzipped[1])
    zVal = list(unzipped[2])

    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.set_facecolor((1.0, 1.0, 1.0))

    xCategories = xVal
    i = 0
    xDict = {}
    x = []

    for category in xCategories:
        if category not in xDict:
            xDict[category] = i
            x.append(i)
            i += 1
        else:
            x.append(xDict[category])
    
    z = np.zeros(len(x))
    dx = np.ones(len(x)) * 0.1
    dy = np.ones(len(x))
    dz = zVal

    ax.bar3d(x, yVal, z, dx, dy, dz)
    ax.set_zlim([0, max(zVal)])
    plt.xticks(range(len(xDict.values())), xDict.keys())
    plt.show()