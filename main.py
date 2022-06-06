from establish_connection import connect
from movie_stats import *
from actor_stats import *
from user_ratings import *

def main():
    cursor = connect()
    average_rating_per_genre(cursor)

if __name__ == '__main__':
    main()