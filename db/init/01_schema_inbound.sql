CREATE TABLE train (
    train_id SERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL
);

CREATE TABLE railcar (
    railcar_id SERIAL PRIMARY KEY,
    owner_code VARCHAR(50) NOT NULL,
    car_type VARCHAR(50) NOT NULL,
    nominal_tar_kg INTEGER NOT NULL
);

CREATE TABLE railcar_manifest (
    railcar_manifest_id SERIAL PRIMARY KEY,
    train_id INTEGER NOT NULL REFERENCES train(train_id),
    railcar_manifest_status VARCHAR(50) NOT NULL,
    arrival_time TIMESTAMP,
    finish_time TIMESTAMP
);

CREATE TABLE operating_unit (
    operating_unit_id SERIAL PRIMARY KEY,
    operating_unit_name VARCHAR(100) NOT NULL,
    operating_unit_type VARCHAR(50) NOT NULL,
    scada_tag_path VARCHAR(255),
    operating_unit_is_active BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    color_hex VARCHAR(7) NOT NULL,
    density_factor DECIMAL(10,4) NOT NULL,
    erp_code VARCHAR(50) NOT NULL
);

CREATE TABLE railcar_load (
    railcar_load_id SERIAL PRIMARY KEY,
    railcar_id INTEGER NOT NULL REFERENCES railcar(railcar_id),
    railcar_manifest_id INTEGER NOT NULL REFERENCES railcar_manifest(railcar_manifest_id),
    product_id INTEGER NOT NULL REFERENCES product(product_id),
    processed_by_unit_id INTEGER REFERENCES operating_unit(operating_unit_id),
    sequence_position INTEGER NOT NULL,
    declared_weight INTEGER,
    actual_gross_weight INTEGER,
    actual_tar_weight INTEGER,
    net_weight_kg INTEGER,
    is_dumped BOOLEAN NOT NULL DEFAULT false,
    dump_timestamp TIMESTAMP
);

CREATE INDEX idx_railcar_load_manifest ON railcar_load(railcar_manifest_id);
CREATE INDEX idx_railcar_load_product ON railcar_load(product_id);
CREATE INDEX idx_railcar_manifest_train ON railcar_manifest(train_id);
CREATE INDEX idx_railcar_load_is_dumped ON railcar_load(is_dumped);