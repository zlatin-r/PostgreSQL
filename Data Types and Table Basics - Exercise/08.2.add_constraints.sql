ALTER TABLE minions_info

ADD CONSTRAINT unique_containt
UNIQUE (id, email)
