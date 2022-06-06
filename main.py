from establish_connection import connect
from movie_stats import *

def main():
    cursor = connect()
    highest_movie_budget_per_year(cursor)

if __name__ == '__main__':
    main()