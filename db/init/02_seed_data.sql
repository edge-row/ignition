-- Clients
INSERT INTO clients (name, account_number) VALUES
('Neptune Terminals', 'NEPT-001'),
('Kinder-Morgan Terminals', 'KM-001'),
('Westshore Terminals', 'WEST-001'),
('Ridley Terminals', 'RIDL-001'),
('Global Container Terminals Canada', 'GCT-001'),
('Puerto Drummond', 'DRUM-001'),
('Pacific Coast Terminals', 'PCT-001'),
('Pacific Elevators', 'PCEL-001'),
('Fiberco Exports', 'FIBR-001'),
('Vale Long Harbor', 'VALE-001');

-- Sources (mines, loading facilities, origin points associated with clients)
INSERT INTO sources (client_id, name, code) VALUES
-- Neptune Terminals sources
(1, 'Fording River Mine', 'FRM-01'),
(1, 'Greenhills Mine', 'GHM-01'),
-- Kinder-Morgan sources
(2, 'Edmonton Terminal', 'EDM-01'),
(2, 'Burnaby Terminal', 'BNB-01'),
-- Westshore Terminals sources
(3, 'Elkview Mine', 'ELK-01'),
(3, 'Line Creek Mine', 'LCM-01'),
(3, 'Coal Mountain', 'CMT-01'),
-- Ridley Terminals sources
(4, 'Quintette Mine', 'QNT-01'),
(4, 'Bullmoose Mine', 'BLM-01'),
-- GCT sources
(5, 'Deltaport Yard', 'DPT-01'),
(5, 'Vanterm Yard', 'VTM-01'),
-- Puerto Drummond sources
(6, 'Drummond Mine Colombia', 'DMC-01'),
-- Pacific Coast Terminals sources
(7, 'Canpotex Saskatoon', 'CPX-SK'),
(7, 'Mosaic Belle Plaine', 'MBP-01'),
(7, 'Nutrien Allan', 'NAL-01'),
-- Pacific Elevators sources
(8, 'Alberta Wheat Pool', 'AWP-01'),
(8, 'Saskatchewan Grain Terminal', 'SGT-01'),
(8, 'Manitoba Pool Elevators', 'MPE-01'),
-- Fiberco Exports sources
(9, 'Pinnacle Pellet Williams Lake', 'PPW-01'),
(9, 'Pinnacle Pellet Burns Lake', 'PPB-01'),
-- Vale Long Harbor sources
(10, 'Voiseys Bay Mine', 'VBM-01'),
(10, 'Thompson Nickel Belt', 'TNB-01');

-- Products
INSERT INTO products (product_name, color_hex, density_factor, erp_code) VALUES
-- Coal
('Thermal Coal', '#2C2C2C', 0.85, 'COAL-THRM'),
('Metallurgical Coal', '#1A1A1A', 0.88, 'COAL-MET'),
-- Metal Concentrates
('Copper Concentrate', '#B87333', 1.85, 'COPPER-CONC'),
('Zinc Concentrate', '#7F8C8D', 1.75, 'ZINC-CONC'),
('Nickel Concentrate', '#C0C0C0', 1.80, 'NICKEL-CONC'),
-- Minerals
('Potash (KCl)', '#FF6B6B', 1.20, 'POTASH-KCL'),
('Sulfur', '#FFD700', 1.35, 'SULFUR-001'),
('Iron Ore', '#8B4513', 2.10, 'IRON-ORE'),
('Aggregate', '#808080', 1.55, 'AGGREGATE-001'),
('Gypsum', '#F5F5DC', 1.30, 'GYPSUM-001'),
-- Agri Products
('Grain - Wheat', '#F5DEB3', 0.77, 'GRAIN-WHT'),
('Grain - Barley', '#DEB887', 0.62, 'GRAIN-BRL'),
('Grain - Canola', '#DAA520', 0.67, 'GRAIN-CAN'),
('Canola Oil', '#E6B800', 0.92, 'CANOLA-OIL'),
-- Wood Products
('Wood Pellets', '#8B4513', 0.65, 'WOODPLT-001'),
-- Petroleum
('Crude Oil', '#1C1C1C', 0.87, 'CRUDE-001'),
('Diesel Fuel', '#4A4A4A', 0.85, 'DIESEL-001'),
('Jet Fuel', '#5C5C5C', 0.80, 'JETFUEL-001');

-- Railcars
INSERT INTO railcars (railcar_number, owner_code, car_type, nominal_tare_kg) VALUES
('CN 789001', 'CN', 'rotary_gondola', 23500),
('CN 789002', 'CN', 'rotary_gondola', 23600),
('CN 789003', 'CN', 'rotary_gondola', 23450),
('CP 456001', 'CP', 'rotary_gondola', 23800),
('CP 456002', 'CP', 'rotary_gondola', 23700),
('CP 456003', 'CP', 'rotary_gondola', 23550),
('BNSF 123001', 'BNSF', 'rotary_gondola', 24000),
('BNSF 123002', 'BNSF', 'rotary_gondola', 23900),
('GATX 901001', 'GATX', 'covered_hopper', 22800),
('GATX 901002', 'GATX', 'covered_hopper', 22750),
('UTLX 801001', 'UTLX', 'covered_hopper', 22600),
('UTLX 801002', 'UTLX', 'covered_hopper', 22650);

-- Operating Units
INSERT INTO operating_units (operating_unit_name, operating_unit_type, scada_tag_path, operating_unit_is_active) VALUES
('Overland Conveyor 1', 'conveyor', '[default]Conveyors/Overland/CV01', true),
('Overland Conveyor 2', 'conveyor', '[default]Conveyors/Overland/CV02', true),
('Tripper 1', 'tripper', '[default]Trippers/TR01', true),
('Tripper 2', 'tripper', '[default]Trippers/TR02', true),
('Rotary Dumper 1', 'dumper', '[default]Dumpers/Rotary/RD01', true),
('Rotary Dumper 2', 'dumper', '[default]Dumpers/Rotary/RD02', true),
('Indexer 1', 'dumper', '[default]Dumpers/Indexer/IX01', true),
('Belly Dumper 1', 'dumper', '[default]Dumpers/Belly/BD01', true),
('Ship Loader 1', 'loader', '[default]ShipLoaders/SL01', true),
('Ship Loader 2', 'loader', '[default]ShipLoaders/SL02', true),
('Stacker Reclaimer 1', 'reclaimer', '[default]Reclaimers/Stacker/SR01', true),
('Stacker Reclaimer 2', 'reclaimer', '[default]Reclaimers/Stacker/SR02', true),
('Portal Reclaimer 1', 'reclaimer', '[default]Reclaimers/Portal/PR01', true),
('Gate Diverter 1', 'diverter', '[default]Diverters/GD01', true),
('Gate Diverter 2', 'diverter', '[default]Diverters/GD02', true),
('Surge Bin 1', 'bin', '[default]Bins/Surge/SB01', true),
('Surge Bin 2', 'bin', '[default]Bins/Surge/SB02', true),
('Sampling System 1', 'sampler', '[default]Sampling/SS01', true),
('Load Out System 1', 'loadout', '[default]LoadOut/LO01', true),
('Load Out System 2', 'loadout', '[default]LoadOut/LO02', true),
('Clam Shell Unloader 1', 'unloader', '[default]ShipUnloaders/ClamShell/CSU01', true),
('Clam Shell Unloader 2', 'unloader', '[default]ShipUnloaders/ClamShell/CSU02', true),
('Travelling Hopper 1', 'hopper', '[default]Hoppers/Travelling/TH01', true),
('Travelling Hopper 2', 'hopper', '[default]Hoppers/Travelling/TH02', true),
('Belt Scale 1', 'scale', '[default]Scales/Belt/BS01', true),
('Belt Scale 2', 'scale', '[default]Scales/Belt/BS02', true),
('Garner Scale 1', 'scale', '[default]Scales/Garner/GS01', true),
('Legal for Trade Scale 1', 'scale', '[default]Scales/LFT/LFT01', true),
('AEI Reader North', 'aei', '[default]AEI/North', true),
('AEI Reader South', 'aei', '[default]AEI/South', true);

-- Trains
INSERT INTO trains (description) VALUES
('Unit Train - Thermal Coal ex Powder River Basin'),
('Unit Train - Potash ex Saskatchewan'),
('Unit Train - Grain ex Alberta'),
('Unit Train - Metallurgical Coal ex Elk Valley'),
('Unit Train - Sulfur ex Fort McMurray');

-- Railcar Manifests (with source_id references)
INSERT INTO railcar_manifests (train_id, source_id, railcar_manifest_status, arrival_time, finish_time) VALUES
(1, 1, 'Complete', NOW() - INTERVAL '5 days', NOW() - INTERVAL '4 days'),      -- Thermal Coal from Fording River
(2, 13, 'Complete', NOW() - INTERVAL '2 days', NOW() - INTERVAL '1 day'),      -- Potash from Canpotex Saskatoon
(3, 16, 'In-Progress', NOW() - INTERVAL '6 hours', NULL),                       -- Grain from Alberta Wheat Pool
(4, 3, 'Scheduled', NULL, NULL),                                                -- Met Coal from Elkview Mine
(5, 2, 'Scheduled', NULL, NULL);                                                -- Sulfur from Edmonton Terminal

-- Railcar Loads for Manifest 1 (Completed - Thermal Coal)
INSERT INTO railcar_loads (railcar_id, railcar_manifest_id, product_id, processed_by_unit_id, sequence_position, declared_weight_kg, actual_gross_weight, actual_tare_weight, is_dumped, dump_timestamp) VALUES
(1, 1, 1, 5, 1, 102000, 125600, 23520, true, NOW() - INTERVAL '4 days 8 hours'),
(2, 1, 1, 5, 2, 101500, 125200, 23610, true, NOW() - INTERVAL '4 days 7 hours'),
(3, 1, 1, 6, 3, 102500, 126100, 23460, true, NOW() - INTERVAL '4 days 6 hours'),
(4, 1, 1, 6, 4, 101000, 124900, 23790, true, NOW() - INTERVAL '4 days 5 hours');

-- Railcar Loads for Manifest 2 (Completed - Potash)
INSERT INTO railcar_loads (railcar_id, railcar_manifest_id, product_id, processed_by_unit_id, sequence_position, declared_weight_kg, actual_gross_weight, actual_tare_weight, is_dumped, dump_timestamp) VALUES
(5, 2, 6, 5, 1, 98000, 121900, 23810, true, NOW() - INTERVAL '1 day 6 hours'),
(6, 2, 6, 5, 2, 97500, 121300, 23710, true, NOW() - INTERVAL '1 day 5 hours'),
(7, 2, 6, 6, 3, 98500, 122200, 23560, true, NOW() - INTERVAL '1 day 4 hours'),
(8, 2, 6, 6, 4, 97000, 120700, 23550, true, NOW() - INTERVAL '1 day 3 hours');

-- Railcar Loads for Manifest 3 (In-Progress - Grain)
INSERT INTO railcar_loads (railcar_id, railcar_manifest_id, product_id, processed_by_unit_id, sequence_position, declared_weight_kg, actual_gross_weight, actual_tare_weight, is_dumped, dump_timestamp) VALUES
(9, 3, 11, 5, 1, 95000, 117900, 22810, true, NOW() - INTERVAL '3 hours'),
(10, 3, 11, 5, 2, 94500, 117300, 22760, true, NOW() - INTERVAL '2 hours');

INSERT INTO railcar_loads (railcar_id, railcar_manifest_id, product_id, processed_by_unit_id, sequence_position, declared_weight_kg, actual_gross_weight, actual_tare_weight, is_dumped, dump_timestamp) VALUES
(11, 3, 11, NULL, 3, 95500, NULL, NULL, false, NULL),
(12, 3, 11, NULL, 4, 94000, NULL, NULL, false, NULL);

-- Railcar Loads for Manifest 4 (Scheduled - Met Coal)
INSERT INTO railcar_loads (railcar_id, railcar_manifest_id, product_id, processed_by_unit_id, sequence_position, declared_weight_kg, actual_gross_weight, actual_tare_weight, is_dumped, dump_timestamp) VALUES
(1, 4, 2, NULL, 1, 103000, NULL, NULL, false, NULL),
(2, 4, 2, NULL, 2, 102500, NULL, NULL, false, NULL),
(3, 4, 2, NULL, 3, 103500, NULL, NULL, false, NULL),
(4, 4, 2, NULL, 4, 102000, NULL, NULL, false, NULL);

-- Railcar Loads for Manifest 5 (Scheduled - Sulfur)
INSERT INTO railcar_loads (railcar_id, railcar_manifest_id, product_id, processed_by_unit_id, sequence_position, declared_weight_kg, actual_gross_weight, actual_tare_weight, is_dumped, dump_timestamp) VALUES
(5, 5, 7, NULL, 1, 95000, NULL, NULL, false, NULL),
(6, 5, 7, NULL, 2, 94500, NULL, NULL, false, NULL),
(7, 5, 7, NULL, 3, 92000, NULL, NULL, false, NULL),
(8, 5, 7, NULL, 4, 91500, NULL, NULL, false, NULL);
