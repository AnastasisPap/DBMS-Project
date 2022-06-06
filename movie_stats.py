def movies_per_year(cursor):
    cursor.execute("""
        select extract(year from release_date), count(*)
        from movie
        where release_date is not null
        group by extract(year from release_date)
        order by extract(year from release_date) asc
        """)
    
    rows = cursor.fetchall()

    for row in rows:
        print(f'{row[0]} -> {row[1]}')

    print()
    print(f'Total rows: {len(rows)}')
    
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

    for row in rows:
        print(f'{row[0]} -> {row[1]}')

    print()
    print(f'Total rows: {len(rows)}')
    
def movies_per_genre_and_year(cursor):
    cursor.execute("""
        select genre.name, x.date_part, x.count
        from genre
        join (
            select mg.genre_id, extract(year from y.release_date), count(*)
            from movie_genres mg
            join (
                select release_date, id
                from movie
                where release_date is not null) y
            on mg.movie_id = y.id
            group by mg.genre_id, extract(year from y.release_date)
            order by mg.genre_id asc) x
        on x.genre_id = genre.id
    """)
    rows = cursor.fetchall()

    for row in rows:
        print(f'{row[0]}, {row[1]} -> {row[2]}')

    print()
    print(f'Total rows: {len(rows)}')

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

    for row in rows:
        print(f'{row[0]} -> {row[1]}')
    
    print()
    print(f'Total rows: {len(rows)}')