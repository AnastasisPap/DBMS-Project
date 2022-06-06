def average_rating_per_user(cursor):
    cursor.execute("""
        select user_id, avg(rating)
        from ratings
        group by user_id
    """)
    rows = cursor.fetchall()

    for row in rows:
        print(f'{row[0]} -> {row[1]}')
    
    print()
    print(f'Total rows: {len(rows)}')

def number_of_ratings_per_user(cursor):
    cursor.execute("""
        select user_id, count(rating)
        from ratings
        group by user_id
    """)
    rows = cursor.fetchall()

    for row in rows:
        print(f'{row[0]} -> {row[1]}')
    
    print()
    print(f'Total rows: {len(rows)}')

def average_rating_per_genre(cursor):
    cursor.execute("""
        select genre_id, avg(rating)
        from ratings
        join (
            select *
            from movie_genres) x
        on x.movie_id = ratings.movie_id
        group by genre_id
    """)
    rows = cursor.fetchall()

    for row in rows:
        print(f'{row[0]} -> {row[1]}')
    
    print()
    print(f'Total rows: {len(rows)}')