use watchdog;

-- peers table
CREATE TABLE IF NOT EXISTS peers (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	address VARCHAR(100) NOT NULL,
	blocked SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
	first_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
	last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
	last_scanned TIMESTAMP NULL,
	CONSTRAINT peers_pk PRIMARY KEY (id),
	CONSTRAINT peers_address_uk UNIQUE KEY (address)
)
AUTO_INCREMENT=1
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- scans tables
CREATE TABLE IF NOT EXISTS scan_versions (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  version VARCHAR(10) NOT NULL,
  CONSTRAINT scan_versions_pk PRIMARY KEY (id),
  CONSTRAINT scan_versions_version_uk UNIQUE KEY (version)
)
AUTO_INCREMENT=1
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS scan_platforms (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  platform VARCHAR(100) NOT NULL,
  CONSTRAINT scan_platforms_pk PRIMARY KEY (id),
  CONSTRAINT scan_platforms_platform_uk UNIQUE KEY (platform)
)
AUTO_INCREMENT=1
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS scans (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	peer_id INT UNSIGNED NOT NULL,
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
	result SMALLINT UNSIGNED NOT NULL,
	rtt SMALLINT UNSIGNED NULL,
	version_id INT UNSIGNED NULL,
	platform_id INT UNSIGNED NULL,
	peers_count SMALLINT UNSIGNED NULL,
	block_height INT UNSIGNED NULL,
	CONSTRAINT scans_pk PRIMARY KEY (id),
  CONSTRAINT scans_peer_id_fk FOREIGN KEY (peer_id) REFERENCES peers (id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
AUTO_INCREMENT=1
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- ssl_checks table
CREATE TABLE IF NOT EXISTS ssl_checks (
		ssl_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		ssl_status INT UNSIGNED NULL,
		ssl_from TIMESTAMP NULL,
		ssl_to TIMESTAMP NULL,
		hash VARCHAR(32) NOT NULL,
  CONSTRAINT ssl_checks_pk PRIMARY KEY (ssl_id),
  CONSTRAINT ssl_checks_hash_uk UNIQUE KEY (hash)
)
AUTO_INCREMENT=1
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


-- loc_checks table
CREATE TABLE IF NOT EXISTS loc_checks (
		loc_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		country_city VARCHAR(191) NOT NULL,
  CONSTRAINT loc_checks_pk PRIMARY KEY (loc_id),
  CONSTRAINT loc_checks_country_city_uk UNIQUE KEY (country_city)
)
AUTO_INCREMENT=1
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


-- checks table
CREATE TABLE IF NOT EXISTS checks (
		id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		hash VARCHAR(32) NOT NULL,
		peer_id INT UNSIGNED NOT NULL,
		blocked SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
		ip VARCHAR(45) DEFAULT NULL,
		loc_id INT UNSIGNED DEFAULT NULL,
		ssl_id INT UNSIGNED DEFAULT NULL,
		api INT UNSIGNED DEFAULT NULL,
		last_scanned TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
	CONSTRAINT checks_pk PRIMARY KEY (id),
	CONSTRAINT checks_hash_uk UNIQUE KEY (hash)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- insert bootstrap peer(s)
INSERT peers (address) VALUES ('wallet.burst-alliance.org:8123') ON DUPLICATE KEY UPDATE last_scanned=NULL;
INSERT peers (address) VALUES ('burst.sagichdir.net:8123') ON DUPLICATE KEY UPDATE last_scanned=NULL;
INSERT peers (address) VALUES ('burst.megash.it:8123') ON DUPLICATE KEY UPDATE last_scanned=NULL;
INSERT peers (address) VALUES ('burstsecurity.com:8123') ON DUPLICATE KEY UPDATE last_scanned=NULL;
INSERT peers (address) VALUES ('wallet.starburst.pink:8123') ON DUPLICATE KEY UPDATE last_scanned=NULL;
