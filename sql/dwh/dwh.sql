CREATE SCHEMA imbi_dwh
DEFAULT CHARSET latin1;


CREATE TABLE imbi_dwh.moviestar (
                moviestar_key INT(10) NOT NULL,
                gender CHAR(1) NOT NULL,
                moviestarname VARCHAR(250) NOT NULL,
                PRIMARY KEY (moviestar_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.movie (
                movie_key INT(10) NOT NULL,
                movie_id VARCHAR(250) NOT NULL,
                movietitle VARCHAR(250) NOT NULL,
                releaseyear INT(4) NOT NULL,
                movietype_key INT(10) NOT NULL,
                genre_key INT(10) NOT NULL,
                color_key INT(10) NOT NULL,
                PRIMARY KEY (movie_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.cast (
                charactername VARCHAR(250) NOT NULL,
                movie_key INT(10) NOT NULL,
                moviestar_key INT(10) NOT NULL,
                credited BOOLEAN NOT NULL,
                billingposition INT(10) NULL,
                PRIMARY KEY (charactername, movie_key, moviestar_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.akaname (
                akaname VARCHAR(250) NOT NULL,
                name VARCHAR(250) NOT NULL,
                PRIMARY KEY (akaname)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.akatitle (
                movietitle VARCHAR(250) NOT NULL,
                akatitle VARCHAR(250) NOT NULL,
                reason VARCHAR(250) NOT NULL,
                country VARCHAR(250) NOT NULL,
                PRIMARY KEY (movietitle)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.distributor (
                distributor_key INT(10) NOT NULL,
                distributorname VARCHAR(250) NOT NULL,
                PRIMARY KEY (distributor_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.moviedistibutorcountry (
                movie_key INT(10) NOT NULL,
                distributor_key INT(10) NOT NULL,
                country_key INT(10) NOT NULL,
                PRIMARY KEY (movie_key, distributor_key, country_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.movietype (
                movietype_key INT(10) NOT NULL,
                movietypename VARCHAR(250) NOT NULL,
                PRIMARY KEY (movietype_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.keyword (
                keyword_key INT(10) NOT NULL,
                keyword VARCHAR(250) NOT NULL,
                PRIMARY KEY (keyword_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.keywordmovie (
                movie_key INT(10) NOT NULL,
                keyword_key INT(10) NOT NULL,
                PRIMARY KEY (movie_key, keyword_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.language (
                language_key INT(10) NOT NULL,
                language VARCHAR(250) NOT NULL,
                PRIMARY KEY (language_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.movielanguage (
                movie_key INT(10) NOT NULL,
                language_key INT(10) NOT NULL,
                PRIMARY KEY (movie_key, language_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.literature (
                literature_key INT(10) NOT NULL,
                isbn VARCHAR(10) NOT NULL,
                authorfirstname VARCHAR(100) NOT NULL,
                authorlastname VARCHAR(100) NOT NULL,
                category VARCHAR(100) NOT NULL,
                title VARCHAR(250) NOT NULL,
                publisher VARCHAR(100) NOT NULL,
                publishingdate DATE NOT NULL,
                pages VARCHAR(50) NOT NULL,
                PRIMARY KEY (literature_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.movieliterature (
                literature_key INT(10) NOT NULL,
                movie_key INT(10) NOT NULL,
                PRIMARY KEY (literature_key, movie_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.person (
                person_key INT(10) NOT NULL,
                personname VARCHAR(250) NOT NULL,
                PRIMARY KEY (person_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.moviepersonrole (
                movie_key INT(10) NOT NULL,
                role_key INT(10) NOT NULL,
                person_key INT(10) NOT NULL,
                PRIMARY KEY (movie_key, role_key, person_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.released (
                releasenumber INT(10) NOT NULL,
                movie_key INT(10) NOT NULL,
                releaseyear INT(10) NOT NULL,
                releasemonth INT(10) NULL,
                releaseday INT(10) NULL,
                runningtime INT(10) NULL,
                country_key INT(10) NOT NULL,
                PRIMARY KEY (releasenumber, movie_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.personrole (
                role_key INT(10) NOT NULL,
                role VARCHAR(250) NOT NULL,
                PRIMARY KEY (role_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.movieranking (
                movie_key INT(10) NOT NULL,
                startdate DATE NOT NULL,
                enddate DATE NOT NULL,
                rank INT(10) NOT NULL,
                votes INT(10) NOT NULL,
                votedistribution CHAR(10) NOT NULL,
                PRIMARY KEY (movie_key, startdate)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.movielink (
                movie_key INT(10) NOT NULL,
                linked_movie_key INT(10) NOT NULL,
                movie_link_type_key INT(10) NOT NULL,
                PRIMARY KEY (movie_key, linked_movie_key, movie_link_type_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.movielinktype (
                movie_link_type_key INT(10) NOT NULL,
                movie_link_type VARCHAR(100) NOT NULL,
                PRIMARY KEY (movie_link_type_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.genre (
                genre_key INT(10) NOT NULL,
                genre VARCHAR(100) NOT NULL,
                PRIMARY KEY (genre_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.country (
                country_key INT(10) NOT NULL,
                country VARCHAR(100) NOT NULL,
                PRIMARY KEY (country_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.rating (
                releasenumber INT(10) NOT NULL,
                movie_key INT(10) NOT NULL,
                rating VARCHAR(50) NOT NULL,
                ratingreason VARCHAR(250) NOT NULL,
                PRIMARY KEY (releasenumber, movie_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.color (
                color_key INT(10) NOT NULL,
                color VARCHAR(100) NOT NULL,
                PRIMARY KEY (color_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.productioncompany (
                productioncompany_key INT(10) NOT NULL,
                productioncompany VARCHAR(250) NOT NULL,
                PRIMARY KEY (productioncompany_key)
) ENGINE = MyISAM;

CREATE TABLE imbi_dwh.movieproductioncompany (
                productioncompany_key INT(10) NOT NULL,
                movie_key INT(10) NOT NULL,
                PRIMARY KEY (productioncompany_key, movie_key)
) ENGINE = MyISAM;


ALTER TABLE imbi_dwh.cast ADD CONSTRAINT actor_cast_fk
FOREIGN KEY (moviestar_key)
REFERENCES imbi_dwh.moviestar (moviestar_key)
;


ALTER TABLE imbi_dwh.cast ADD CONSTRAINT movie_cast_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.moviedistibutorcountry ADD CONSTRAINT movie_moviedistibutorcountry_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.keywordmovie ADD CONSTRAINT movie_keywordmovie_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.movielanguage ADD CONSTRAINT movie_movielanguage_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.movieliterature ADD CONSTRAINT movie_movieliterature_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.moviepersonrole ADD CONSTRAINT movie_moviepersonrole_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.released ADD CONSTRAINT movie_release_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.movieranking ADD CONSTRAINT movie_movieranking_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.movielink ADD CONSTRAINT movie_movierelation_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.movielink ADD CONSTRAINT movie_movierelation_fk_1
FOREIGN KEY (linked_movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.movieproductioncompany ADD CONSTRAINT movie_movieproductioncompany_fk
FOREIGN KEY (movie_key)
REFERENCES imbi_dwh.movie (movie_key)
;


ALTER TABLE imbi_dwh.moviedistibutorcountry ADD CONSTRAINT distributor_moviedistibutorcountry_fk
FOREIGN KEY (distributor_key)
REFERENCES imbi_dwh.distributor (distributor_key)
;


ALTER TABLE imbi_dwh.movie ADD CONSTRAINT movietype_movie_fk
FOREIGN KEY (movietype_key)
REFERENCES imbi_dwh.movietype (movietype_key)
;


ALTER TABLE imbi_dwh.keywordmovie ADD CONSTRAINT keyword_keywordmovie_fk
FOREIGN KEY (keyword_key)
REFERENCES imbi_dwh.keyword (keyword_key)
;


ALTER TABLE imbi_dwh.movielanguage ADD CONSTRAINT language_movielanguage_fk
FOREIGN KEY (language_key)
REFERENCES imbi_dwh.language (language_key)
;


ALTER TABLE imbi_dwh.movieliterature ADD CONSTRAINT literature_movieliterature_fk
FOREIGN KEY (literature_key)
REFERENCES imbi_dwh.literature (literature_key)
;


ALTER TABLE imbi_dwh.moviepersonrole ADD CONSTRAINT person_moviepersonrole_fk
FOREIGN KEY (person_key)
REFERENCES imbi_dwh.person (person_key)
;


ALTER TABLE imbi_dwh.rating ADD CONSTRAINT released_rating_fk
FOREIGN KEY (releasenumber, movie_key)
REFERENCES imbi_dwh.released (releasenumber, movie_key)
;


ALTER TABLE imbi_dwh.moviepersonrole ADD CONSTRAINT personrole_moviepersonrole_fk
FOREIGN KEY (role_key)
REFERENCES imbi_dwh.personrole (role_key)
;


ALTER TABLE imbi_dwh.movielink ADD CONSTRAINT movierelationtype_movierelation_fk
FOREIGN KEY (movie_link_type_key)
REFERENCES imbi_dwh.movielinktype (movie_link_type_key)
;


ALTER TABLE imbi_dwh.movie ADD CONSTRAINT genre_movie_fk
FOREIGN KEY (genre_key)
REFERENCES imbi_dwh.genre (genre_key)
;


ALTER TABLE imbi_dwh.moviedistibutorcountry ADD CONSTRAINT country_moviedistibutorcountry_fk
FOREIGN KEY (country_key)
REFERENCES imbi_dwh.country (country_key)
;


ALTER TABLE imbi_dwh.released ADD CONSTRAINT country_released_fk
FOREIGN KEY (country_key)
REFERENCES imbi_dwh.country (country_key)
;


ALTER TABLE imbi_dwh.movie ADD CONSTRAINT color_movie_fk
FOREIGN KEY (color_key)
REFERENCES imbi_dwh.color (color_key)
;


ALTER TABLE imbi_dwh.movieproductioncompany ADD CONSTRAINT productioncompany_movieproductioncompany_fk
FOREIGN KEY (productioncompany_key)
REFERENCES imbi_dwh.productioncompany (productioncompany_key)
;
