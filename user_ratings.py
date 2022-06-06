from plotting import *

def average_rating_per_user(cursor):
    cursor.execute("""
        select avg(rating)
        from ratings
        group by user_id
        order by user_id asc
    """)
    rows = cursor.fetchall()

    return [x[0] for x in rows]

def number_of_ratings_per_user(cursor):
    cursor.execute("""
        select count(rating)
        from ratings
        group by user_id
        order by user_id asc
    """)
    rows = cursor.fetchall()

    return [x[0] for x in rows]

def average_rating_per_genre(cursor):
    cursor.execute("""
        select genre.name, y.avg
        from genre
        join (
            select genre_id, avg(rating)
            from ratings
            join (
                select *
                from movie_genres) x
            on x.movie_id = ratings.movie_id
            group by genre_id) y
        on y.genre_id = genre.id
    """)
    rows = cursor.fetchall()

    plot_bar(rows, 'Genres', 'Average Rating', 'Task 9')

def plot_ratings_and_number(cursor):
    x = number_of_ratings_per_user(cursor)
    y = average_rating_per_user(cursor)

    plot_scatter(x, y, '# of ratings/user', 'Average rating/user', 'Number of ratings and average rating per user')