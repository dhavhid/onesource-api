ALTER TABLE requesting_offices ALTER COLUMN address1 DROP NOT NULL;
ALTER TABLE requesting_offices ALTER COLUMN city DROP NOT NULL;
ALTER TABLE requesting_offices ALTER COLUMN zipcode DROP NOT NULL;
ALTER TABLE requesting_offices ALTER COLUMN phone DROP NOT NULL;
ALTER TABLE clients ALTER COLUMN body_parts DROP NOT NULL;
ALTER TABLE clients ADD COLUMN notification_sent INT NOT NULL DEFAULT 0;
ALTER TABLE clients ADD COLUMN notification_date TIMESTAMP;