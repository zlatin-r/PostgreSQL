ALTER TABLE countries_rivers
ADD CONSTRAINT fk_countries_rivers_id
    FOREIGN KEY (river_id)
    REFERENCES rivers (id)
    ON UPDATE CASCADE;

ALTER TABLE countries_rivers
ADD CONSTRAINT fk_countries_rivers_country
    FOREIGN KEY (country_code)
    REFERENCES countries (country_code)
    ON UPDATE CASCADE;