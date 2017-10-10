DROP TABLE IF EXISTS bounties;
DROP TYPE IF EXISTS DANGER_LEVEL;

CREATE TYPE DANGER_LEVEL AS ENUM ('low', 'medium', 'high', 'ermagerdyerderd');

CREATE TABLE bounties (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  value INT2,
  danger_level DANGER_LEVEL,
  last_known_location VARCHAR(255)
);