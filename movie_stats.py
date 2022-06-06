from plotting import *

def movies_per_year(cursor):
    cursor.execute("""
        select extract(year from release_date) rel_year, count(*)
        from movie
        where release_date is not null
        group by rel_year
        order by rel_year asc
        """)
    
    rows = cursor.fetchall()
    plot_bar(rows, 'Release year', 'Total movies', 'Movies Per Year')
    
def movies_per_genre(cursor):
    cursor.execute("""
        select genre.name, x.count
        from genre
        join (select genre.id, count(mg.movie_id)
            from genre 
            left join movie_genres mg
            on genre.id = mg.genre_id
            group by genre.id) x
        on x.id = genre.id
    """)
    rows = cursor.fetchall()

    plot_bar(rows, 'Genre', 'Movie count', 'Movies per genre', 90)
    
def movies_per_genre_and_year(cursor):
    cursor.execute("""
        select genre.name, x.rel_year, x.count
        from genre
        join (
            select mg.genre_id, extract(year from y.release_date) rel_year, count(*)
            from movie_genres mg
            join (
                select release_date, id
                from movie
                where release_date is not null) y
            on mg.movie_id = y.id
            group by mg.genre_id, rel_year
            order by mg.genre_id asc) x
        on x.genre_id = genre.id
    """)
    rows = cursor.fetchall()
    plot_3d(rows)


def highest_movie_budget_per_year(cursor):
    cursor.execute("""
        select date_part, max(budget)
        from (
            select extract(year from release_date), budget
            from movie
            where release_date is not null) x
        group by date_part
    """)
    rows = cursor.fetchall()

    plot_bar(rows, 'Release year', 'Highest Budget', 'Highest movie budget per year')