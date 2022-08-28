CREATE OR REPLACE FUNCTION format_country_name_trigger()
RETURNS TRIGGER AS
$$
DECLARE is_capitalized_name BOOLEAN;
BEGIN
NEW.name := CONCAT(UPPER(SUBSTRING(NEW.name,1,1)),LOWER(SUBSTRING(NEW.name,2)));
RETURN NEW;
END
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER check_country_name_on_insert BEFORE INSERT ON nations
FOR EACH ROW
EXECUTE FUNCTION format_country_name_trigger();

CREATE TRIGGER check_country_name_on_update BEFORE UPDATE ON nations
FOR EACH ROW
EXECUTE FUNCTION format_country_name_trigger();
