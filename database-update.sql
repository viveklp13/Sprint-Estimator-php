-- Add actual phase efforts columns to features table
ALTER TABLE features
ADD COLUMN actual_req_man_days DECIMAL(10,2) DEFAULT 0,
ADD COLUMN actual_design_man_days DECIMAL(10,2) DEFAULT 0,
ADD COLUMN actual_dev_man_days DECIMAL(10,2) DEFAULT 0,
ADD COLUMN actual_testing_man_days DECIMAL(10,2) DEFAULT 0,
ADD COLUMN actual_pm_man_days DECIMAL(10,2) DEFAULT 0,
ADD COLUMN actual_total_man_days DECIMAL(10,2) DEFAULT 0;
