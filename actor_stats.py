def actor_revenue(cursor):
    cursor.execute("""
        select sum(revenue)
        from movie
        join (
            select movie_id
            from movie_cast
            where person_id = 1245) x
        on x.movie_id = movie.id
    """)
    rows = cursor.fetchall()

    print(f'Total revenue: {rows[0][0]}')