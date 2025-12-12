CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS features (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    org_productivity DECIMAL(10,2) NOT NULL,
    man_days_hours DECIMAL(10,2) NOT NULL,
    total_story_points DECIMAL(10,2) DEFAULT 0,
    total_man_days DECIMAL(10,2) DEFAULT 0,
    estimated_start_date DATE,
    target_end_date DATE,
    actual_req_man_days DECIMAL(10,2) DEFAULT 0,
    actual_design_man_days DECIMAL(10,2) DEFAULT 0,
    actual_dev_man_days DECIMAL(10,2) DEFAULT 0,
    actual_testing_man_days DECIMAL(10,2) DEFAULT 0,
    actual_pm_man_days DECIMAL(10,2) DEFAULT 0,
    actual_total_man_days DECIMAL(10,2) DEFAULT 0,
    sit_defects INT DEFAULT 0,
    uat_defects INT DEFAULT 0,
    defect_removal_efficiency DECIMAL(5,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS user_stories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    feature_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    hours DECIMAL(10,2) NOT NULL,
    man_days DECIMAL(10,2) NOT NULL,
    story_points DECIMAL(10,2) NOT NULL,
    estimated_start_date DATE,
    target_end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (feature_id) REFERENCES features(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS productivity_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    feature_id INT NOT NULL,
    story_id INT NOT NULL,
    hours_taken DECIMAL(10,2) NOT NULL,
    efforts_man_days DECIMAL(10,2) NOT NULL,
    actual_start_date DATE,
    actual_end_date DATE,
    is_completed TINYINT(1) DEFAULT 0,
    productivity DECIMAL(10,4) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (feature_id) REFERENCES features(id) ON DELETE CASCADE,
    FOREIGN KEY (story_id) REFERENCES user_stories(id) ON DELETE CASCADE,
    UNIQUE KEY unique_story_productivity (feature_id, story_id)
);
