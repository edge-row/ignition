-- Procedure 1: Create empty manifest
CREATE OR REPLACE FUNCTION sp_create_manifest()
RETURNS INT AS $$
DECLARE
    v_manifest_id INT;
    v_train_id INT;
BEGIN
    -- Create train record
    INSERT INTO trains (description)
    VALUES ('EDI Import')
    RETURNING train_id INTO v_train_id;

    -- Create manifest
    INSERT INTO railcar_manifests (train_id, railcar_manifest_status, arrival_time)
    VALUES (v_train_id, 'Scheduled', NOW())
    RETURNING railcar_manifest_id INTO v_manifest_id;

    RETURN v_manifest_id;
END;
$$ LANGUAGE plpgsql;


-- Procedure 2: Add one car to manifest
CREATE OR REPLACE FUNCTION sp_add_car(
    p_manifest_id INT,
    p_railcar_number VARCHAR,
    p_product_code VARCHAR,
    p_declared_weight INT
)
RETURNS BOOLEAN AS $$
DECLARE
    v_railcar_id INT;
    v_product_id INT;
    v_next_seq INT;
BEGIN
    -- Get product ID
    SELECT product_id INTO v_product_id
    FROM products WHERE erp_code = p_product_code;

    IF v_product_id IS NULL THEN
        RETURN FALSE;
    END IF;

    -- Get or create railcar
    SELECT railcar_id INTO v_railcar_id
    FROM railcars WHERE railcar_number = p_railcar_number;

    IF v_railcar_id IS NULL THEN
        INSERT INTO railcars (railcar_number, car_type, nominal_tare_kg)
        VALUES (p_railcar_number, 'rotary_gondola', 23500)
        RETURNING railcar_id INTO v_railcar_id;
    END IF;

    -- Get next sequence number
    SELECT COALESCE(MAX(sequence_position), 0) + 1 INTO v_next_seq
    FROM railcar_loads WHERE railcar_manifest_id = p_manifest_id;

    -- Insert load
    INSERT INTO railcar_loads (
        railcar_manifest_id, railcar_id, product_id,
        sequence_position, declared_weight_kg, is_dumped
    ) VALUES (
        p_manifest_id, v_railcar_id, v_product_id,
        v_next_seq, p_declared_weight, FALSE
    );

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;
