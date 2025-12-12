-- Add defect tracking columns to features table
ALTER TABLE features
ADD COLUMN sit_defects INT DEFAULT 0,
ADD COLUMN uat_defects INT DEFAULT 0,
ADD COLUMN defect_removal_efficiency DECIMAL(5,2) DEFAULT 0;
