def movies_per_year(cursor):
    cursor.execute("""
        select extract(year from release_date), count(*)
        from movie
        group by extract(year from release_date)
        order by extract(year from release_date) asc
        """)
    
    rows = cursor.fetchall()

    for row in rows:
        print(f'{row[0]} -> {row[1]}')
    
def movies_per_gender(cursor):
    cursor.execute("""
        select genre.name, x.count
        from genre
        join (select genre_id, count(*)
        from movie_genres
        group by genre_id) x
        on x.genre_id = genre.id
    """)
    rows = cursor.fetchall()

    for row in rows:
        print(f'{row[0]} -> {row[1]}')
    
def movies_per_gender_and_year(cursor):
    cursor.execute("""
        select genre.name, x.date_part, x.count
        from genre
        join (select mg.genre_id, extract(year from x.release_date), count(*)
        from movie_genres mg
        join (
            select release_date, id
            from movie) x
        on mg.movie_id = x.id
        group by mg.genre_id, extract(year from x.release_date)
        order by mg.genre_id asc) x
        on x.genre_id = genre.id
    """)
    rows = cursor.fetchall()

    for row in rows:
        print(f'{row[0]}, {row[1]} -> {row[2]}')

def highest_movie_budget_per_year(cursor):
    cursor.execute("""
        select date_part, max(budget)
        from (
            select extract(year from release_date), budget
            from movie) x
        group by date_part
    """)
    rows = cursor.fetchall()

    for row in rows:
        print(f'{row[0]} -> {row[1]}')