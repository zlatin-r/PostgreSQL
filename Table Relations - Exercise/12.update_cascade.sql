ALTER TABLE countries
ADD CONSTRAINT fk_country_river
    FOREIGN KEY (country_code)
    REFERENCES countries_rivers (country_code)
    ON UPDATE CASCADE;