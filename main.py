from establish_connection import connect
from movie_stats import *
from actor_stats import *
from user_ratings import *

def main():
    cursor = connect()
    # Plot movie statistics
    movies_per_year(cursor)
    movies_per_genre(cursor)
    highest_movie_budget_per_year(cursor)
    movies_per_genre_and_year(cursor)
    # Plot Total revenue per year for movies that Scarlett Johanson plays
    actor_revenue(cursor)
    # Plot ratings
    plot_ratings_and_number(cursor)
    average_rating_per_genre(cursor)

if __name__ == '__main__':
    main()