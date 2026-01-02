CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    account_number VARCHAR(50) UNIQUE
);

CREATE TABLE sources (
    source_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id),
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    color_hex VARCHAR(7),
    density_factor DECIMAL(5,3),
    erp_code VARCHAR(50)
);

CREATE TABLE operating_units (
    operating_unit_id SERIAL PRIMARY KEY,
    operating_unit_name VARCHAR(50) NOT NULL,
    operating_unit_type VARCHAR(20),
    scada_tag_path VARCHAR(255),
    operating_unit_is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE trains (
    train_id SERIAL PRIMARY KEY,
    description VARCHAR(100)
);

CREATE TABLE railcars (
    railcar_id SERIAL PRIMARY KEY,
    railcar_number VARCHAR(20) UNIQUE NOT NULL,
    owner_code VARCHAR(10),
    car_type VARCHAR(20),
    nominal_tare_kg INT
);

CREATE TABLE railcar_manifests (
    railcar_manifest_id SERIAL PRIMARY KEY,
    train_id INT REFERENCES trains(train_id),
    source_id INT REFERENCES sources(source_id),
    railcar_manifest_status VARCHAR(20) CHECK (railcar_manifest_status IN ('Scheduled', 'In-Progress', 'Complete', 'Rejected')),
    arrival_time TIMESTAMP,
    finish_time TIMESTAMP
);

CREATE TABLE railcar_loads (
    railcar_load_id SERIAL PRIMARY KEY,
    railcar_manifest_id INT REFERENCES railcar_manifests(railcar_manifest_id),
    railcar_id INT REFERENCES railcars(railcar_id),
    product_id INT REFERENCES products(product_id),
    processed_by_unit_id INT REFERENCES operating_units(operating_unit_id),
    sequence_position INT NOT NULL,
    declared_weight_kg INT,
    actual_gross_weight INT,
    actual_tare_weight INT,
    net_weight_kg INT GENERATED ALWAYS AS (actual_gross_weight - actual_tare_weight) STORED,
    is_dumped BOOLEAN DEFAULT FALSE,
    dump_timestamp TIMESTAMP
);