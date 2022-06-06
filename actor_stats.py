from plotting import *

def actor_revenue(cursor):
    cursor.execute("""
        select extract(year from release_date) rel_year, sum(revenue)
        from movie
        join (
            select movie_id
            from movie_cast
            where person_id = 1245) x
        on x.movie_id = movie.id
        group by rel_year
    """)
    rows = cursor.fetchall()

    plot_bar(rows, 'Release year', 'Revenue from all movies (per year)', 'Scarlett Johanson movie revenues')