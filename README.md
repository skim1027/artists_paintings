# Artists and Paintings (Relational Rails)

In this project, one-to-many-relationship between artist and paintings is demonstrated as shown in below table: 

| Artists                  | Paintings              |
|:----:                    | :----:                 |
| id - integer             | id - integer           |
| name - text              | artist_id - integer    |
| country - text           | name - text            |
| year_born - integer      | year_painted - integer |
| alive - boolean          | oil_paiting - boolean |
| created_at - timestamp   | created_at - timestamp |
| updated_at - timestamp   | updated_at - timestamp |

Each artist is related to the paintings by the foreign key from paintings.


