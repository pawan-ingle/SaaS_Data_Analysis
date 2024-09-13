-- STEP 1: CREATE TABLES

-- 1. Users Table (Customers Who Use The SaaS Product)

CREATE TABLE users (
	user_id int primary key,
	first_name varchar(50),
	last_name varchar(100),
	email varchar(150) unique,
	signup_date date,
	subscription_plan varchar(50),
	status varchar(50)
);

--2. Features Table (Available features in SaaS Product)

CREATE TABLE features (
    feature_id INT PRIMARY KEY,
    feature_name VARCHAR(100),
    description VARCHAR(255)
);

--3. Usage Table (Records the usage of different features by users)

CREATE TABLE usage (
    usage_id INT PRIMARY KEY,
    user_id INT,
    feature_id INT,
    usage_date DATE,
    usage_duration_minutes INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (feature_id) REFERENCES features(feature_id)
);

--4. Subscription Payments Table (Records subscription payments made by users)

CREATE TABLE subscription_payments (
    payment_id INT PRIMARY KEY,
    user_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    subscription_plan VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

--5. Feedback table (Records user feedback or reviews on the platform)

CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY,
    user_id INT,
    feedback_date DATE,
    rating INT, -- Rating out of 5
    comments VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);




-- STEP 2: INSERTING DATA 

--1. Insert into users
INSERT INTO users (user_id, first_name, last_name, email, signup_date, subscription_plan, status)
VALUES
(1, 'Amit', 'Sharma', 'amit.sharma@example.com', '2024-01-05', 'Free', 'Active'),
(2, 'Sneha', 'Patel', 'sneha.patel@example.com', '2024-01-10', 'Premium', 'Active'),
(3, 'Ravi', 'Deshmukh', 'ravi.deshmukh@example.com', '2024-01-15', 'Basic', 'Cancelled'),
(4, 'Priya', 'Verma', 'priya.verma@example.com', '2024-01-20', 'Free', 'Active'),
(5, 'Ankit', 'Jain', 'ankit.jain@example.com', '2024-01-25', 'Premium', 'Active'),
(6, 'Ritu', 'Mehta', 'ritu.mehta@example.com', '2024-02-01', 'Free', 'Active'),
(7, 'Vikram', 'Reddy', 'vikram.reddy@example.com', '2024-02-05', 'Basic', 'Cancelled'),
(8, 'Deepak', 'Singh', 'deepak.singh@example.com', '2024-02-10', 'Premium', 'Active'),
(9, 'Kiran', 'Nair', 'kiran.nair@example.com', '2024-02-15', 'Free', 'Active'),
(10, 'Megha', 'Kapoor', 'megha.kapoor@example.com', '2024-02-20', 'Basic', 'Active'),
(11, 'Manish', 'Joshi', 'manish.joshi@example.com', '2024-02-25', 'Free', 'Active'),
(12, 'Neha', 'Rao', 'neha.rao@example.com', '2024-03-01', 'Premium', 'Active'),
(13, 'Raj', 'Gupta', 'raj.gupta@example.com', '2024-03-05', 'Basic', 'Cancelled'),
(14, 'Rohit', 'Pillai', 'rohit.pillai@example.com', '2024-03-10', 'Free', 'Active'),
(15, 'Pooja', 'Kumar', 'pooja.kumar@example.com', '2024-03-15', 'Premium', 'Active'),
(16, 'Arjun', 'Bansal', 'arjun.bansal@example.com', '2024-03-20', 'Basic', 'Active'),
(17, 'Sunita', 'Desai', 'sunita.desai@example.com', '2024-03-25', 'Free', 'Active'),
(18, 'Suresh', 'Menon', 'suresh.menon@example.com', '2024-04-01', 'Premium', 'Active'),
(19, 'Lakshmi', 'Nayak', 'lakshmi.nayak@example.com', '2024-04-05', 'Basic', 'Cancelled'),
(20, 'Ajay', 'Rathore', 'ajay.rathore@example.com', '2024-04-10', 'Free', 'Active'),
(21, 'Alok', 'Sen', 'alok.sen@example.com', '2024-04-15', 'Premium', 'Active'),
(22, 'Vivek', 'Iyer', 'vivek.iyer@example.com', '2024-04-20', 'Basic', 'Active'),
(23, 'Seema', 'Chopra', 'seema.chopra@example.com', '2024-04-25', 'Free', 'Active'),
(24, 'Nikhil', 'Saxena', 'nikhil.saxena@example.com', '2024-05-01', 'Premium', 'Active'),
(25, 'Rashi', 'Malhotra', 'rashi.malhotra@example.com', '2024-05-05', 'Basic', 'Cancelled'),
(26, 'Shubham', 'Kapoor', 'shubham.kapoor@example.com', '2024-05-10', 'Free', 'Active'),
(27, 'Aditi', 'Thakur', 'aditi.thakur@example.com', '2024-05-15', 'Premium', 'Active'),
(28, 'Ashish', 'Chandra', 'ashish.chandra@example.com', '2024-05-20', 'Basic', 'Active'),
(29, 'Divya', 'Goswami', 'divya.goswami@example.com', '2024-05-25', 'Free', 'Active'),
(30, 'Kunal', 'Pandey', 'kunal.pandey@example.com', '2024-06-01', 'Premium', 'Active'),
(31, 'Nisha', 'Gupta', 'nisha.gupta@example.com', '2024-06-05', 'Basic', 'Cancelled'),
(32, 'Rahul', 'Tripathi', 'rahul.tripathi@example.com', '2024-06-10', 'Free', 'Active'),
(33, 'Bhavna', 'Mishra', 'bhavna.mishra@example.com', '2024-06-15', 'Premium', 'Active'),
(34, 'Naveen', 'Jha', 'naveen.jha@example.com', '2024-06-20', 'Basic', 'Active'),
(35, 'Swati', 'Ahuja', 'swati.ahuja@example.com', '2024-06-25', 'Free', 'Active'),
(36, 'Gaurav', 'Tiwari', 'gaurav.tiwari@example.com', '2024-07-01', 'Premium', 'Active'),
(37, 'Anjali', 'Kohli', 'anjali.kohli@example.com', '2024-07-05', 'Basic', 'Cancelled'),
(38, 'Siddharth', 'Kapoor', 'siddharth.kapoor@example.com', '2024-07-10', 'Free', 'Active'),
(39, 'Tina', 'Shah', 'tina.shah@example.com', '2024-07-15', 'Premium', 'Active'),
(40, 'Rohan', 'Jain', 'rohan.jain@example.com', '2024-07-20', 'Basic', 'Active'),
(41, 'Kirti', 'Garg', 'kirti.garg@example.com', '2024-07-25', 'Free', 'Active'),
(42, 'Manoj', 'Srinivas', 'manoj.srinivas@example.com', '2024-08-01', 'Premium', 'Active'),
(43, 'Pallavi', 'Reddy', 'pallavi.reddy@example.com', '2024-08-05', 'Basic', 'Cancelled'),
(44, 'Shivam', 'Naidu', 'shivam.naidu@example.com', '2024-08-10', 'Free', 'Active'),
(45, 'Neeraj', 'Vyas', 'neeraj.vyas@example.com', '2024-08-15', 'Premium', 'Active'),
(46, 'Simran', 'Bedi', 'simran.bedi@example.com', '2024-08-20', 'Basic', 'Active'),
(47, 'Ashok', 'Khan', 'ashok.khan@example.com', '2024-08-25', 'Free', 'Active'),
(48, 'Tanvi', 'Chauhan', 'tanvi.chauhan@example.com', '2024-09-01', 'Premium', 'Active'),
(49, 'Umesh', 'Pathak', 'umesh.pathak@example.com', '2024-09-05', 'Basic', 'Cancelled'),
(50, 'Mahesh', 'Pawar', 'mahesh.pawar@example.com', '2024-09-10', 'Free', 'Active'),
(51, 'Vikas', 'Shukla', 'vikas.shukla@example.com', '2024-01-05', 'Free', 'Active'),
(52, 'Ananya', 'Das', 'ananya.das@example.com', '2024-01-10', 'Premium', 'Active'),
(53, 'Rajesh', 'Gandhi', 'rajesh.gandhi@example.com', '2024-01-15', 'Basic', 'Cancelled'),
(54, 'Meera', 'Nambiar', 'meera.nambiar@example.com', '2024-01-20', 'Free', 'Active'),
(55, 'Sanjay', 'Rao', 'sanjay.rao@example.com', '2024-01-25', 'Premium', 'Active'),
(56, 'Rekha', 'Agarwal', 'rekha.agarwal@example.com', '2024-02-01', 'Free', 'Active'),
(57, 'Nitin', 'Yadav', 'nitin.yadav@example.com', '2024-02-05', 'Basic', 'Cancelled'),
(58, 'Komal', 'Bhatia', 'komal.bhatia@example.com', '2024-02-10', 'Premium', 'Active'),
(59, 'Abhishek', 'Roy', 'abhishek.roy@example.com', '2024-02-15', 'Free', 'Active'),
(60, 'Snehal', 'Kulkarni', 'snehal.kulkarni@example.com', '2024-02-20', 'Basic', 'Active'),
(61, 'Sakshi', 'Shah', 'sakshi.shah@example.com', '2024-02-25', 'Free', 'Active'),
(62, 'Naveen', 'Kapoor', 'naveen.kapoor@example.com', '2024-03-01', 'Premium', 'Active'),
(63, 'Arvind', 'Desai', 'arvind.desai@example.com', '2024-03-05', 'Basic', 'Cancelled'),
(64, 'Juhi', 'Pawar', 'juhi.pawar@example.com', '2024-03-10', 'Free', 'Active'),
(65, 'Manoj', 'Basu', 'manoj.basu@example.com', '2024-03-15', 'Premium', 'Active'),
(66, 'Isha', 'Malhotra', 'isha.malhotra@example.com', '2024-03-20', 'Basic', 'Active'),
(67, 'Rakesh', 'Bhargava', 'rakesh.bhargava@example.com', '2024-03-25', 'Free', 'Active'),
(68, 'Pallavi', 'Rathi', 'pallavi.rathi@example.com', '2024-04-01', 'Premium', 'Active'),
(69, 'Vivek', 'Gupta', 'vivek.gupta@example.com', '2024-04-05', 'Basic', 'Cancelled'),
(70, 'Swati', 'Kulkarni', 'swati.kulkarni@example.com', '2024-04-10', 'Free', 'Active'),
(71, 'Gopal', 'Jadhav', 'gopal.jadhav@example.com', '2024-04-15', 'Premium', 'Active'),
(72, 'Ritu', 'Nair', 'ritu.nair@example.com', '2024-04-20', 'Basic', 'Active'),
(73, 'Ankur', 'Mehta', 'ankur.mehta@example.com', '2024-04-25', 'Free', 'Active'),
(74, 'Pooja', 'Saini', 'pooja.saini@example.com', '2024-05-01', 'Premium', 'Active'),
(75, 'Tushar', 'Kumar', 'tushar.kumar@example.com', '2024-05-05', 'Basic', 'Cancelled'),
(76, 'Madhuri', 'Bhat', 'madhuri.bhat@example.com', '2024-05-10', 'Free', 'Active'),
(77, 'Ashok', 'Singh', 'ashok.singh@example.com', '2024-05-15', 'Premium', 'Active'),
(78, 'Chirag', 'Patil', 'chirag.patil@example.com', '2024-05-20', 'Basic', 'Active'),
(79, 'Ravi', 'Ghosh', 'ravi.ghosh@example.com', '2024-05-25', 'Free', 'Active'),
(80, 'Kavita', 'Menon', 'kavita.menon@example.com', '2024-06-01', 'Premium', 'Active'),
(81, 'Arun', 'Tripathi', 'arun.tripathi@example.com', '2024-06-05', 'Basic', 'Cancelled'),
(82, 'Divya', 'Saxena', 'divya.saxena@example.com', '2024-06-10', 'Free', 'Active'),
(83, 'Rahul', 'Nair', 'rahul.nair@example.com', '2024-06-15', 'Premium', 'Active'),
(84, 'Anita', 'Bose', 'anita.bose@example.com', '2024-06-20', 'Basic', 'Active'),
(85, 'Jayesh', 'Pandit', 'jayesh.pandit@example.com', '2024-06-25', 'Free', 'Active'),
(86, 'Aditi', 'Joshi', 'aditi.joshi@example.com', '2024-07-01', 'Premium', 'Active'),
(87, 'Sandeep', 'Kulkarni', 'sandeep.kulkarni@example.com', '2024-07-05', 'Basic', 'Cancelled'),
(88, 'Neha', 'Das', 'neha.das@example.com', '2024-07-10', 'Free', 'Active'),
(89, 'Rohit', 'Bajpai', 'rohit.bajpai@example.com', '2024-07-15', 'Premium', 'Active'),
(90, 'Priya', 'Sinha', 'priya.sinha@example.com', '2024-07-20', 'Basic', 'Active'),
(91, 'Nishant', 'Shah', 'nishant.shah@example.com', '2024-07-25', 'Free', 'Active'),
(92, 'Rashmi', 'Reddy', 'rashmi.reddy@example.com', '2024-08-01', 'Premium', 'Active'),
(93, 'Prakash', 'Varma', 'prakash.varma@example.com', '2024-08-05', 'Basic', 'Cancelled'),
(94, 'Shilpa', 'Patil', 'shilpa.patil@example.com', '2024-08-10', 'Free', 'Active'),
(95, 'Uday', 'Sharma', 'uday.sharma@example.com', '2024-08-15', 'Premium', 'Active'),
(96, 'Kiran', 'Chakraborty', 'kiran.chakraborty@example.com', '2024-08-20', 'Basic', 'Active'),
(97, 'Varun', 'Deshpande', 'varun.deshpande@example.com', '2024-08-25', 'Free', 'Active'),
(98, 'Simran', 'Mehra', 'simran.mehra@example.com', '2024-09-01', 'Premium', 'Active'),
(99, 'Irfan', 'Ali', 'irfan.ali@example.com', '2024-09-05', 'Basic', 'Cancelled'),
(100, 'Jatin', 'Mitra', 'jatin.mitra@example.com', '2024-09-10', 'Free', 'Active'),
(101, 'Niharika', 'Shetty', 'niharika.shetty@example.com', '2024-09-12', 'Premium', 'Active'),
(102, 'Sameer', 'Kohli', 'sameer.kohli@example.com', '2024-09-15', 'Basic', 'Active'),
(103, 'Vinay', 'Bhatt', 'vinay.bhatt@example.com', '2024-09-18', 'Free', 'Active'),
(104, 'Sonal', 'Khanna', 'sonal.khanna@example.com', '2024-09-20', 'Premium', 'Active'),
(105, 'Rahul', 'Saxena', 'rahul.saxena@example.com', '2024-09-25', 'Free', 'Active');
select * from users;

--2. Insert into features
INSERT INTO features (feature_id, feature_name, description) VALUES
(1, 'Customer Relationship Management (CRM)', 'Helps businesses manage customer interactions and improve sales strategies.'),
(2, 'Human Resource Management (HRM)', 'Cloud-based solutions for recruitment, employee engagement, payroll, and performance management.'),
(3, 'Enterprise Resource Planning (ERP)', 'Streamlines business processes across finance, operations, and supply chain.'),
(4, 'Marketing Automation', 'Automates marketing campaigns and provides tools to track performance.'),
(5, 'Cloud Data Storage', 'Secure cloud storage, backup solutions, and data recovery services.'),
(6, 'Communication and Collaboration Tools', 'Enables team communication and collaboration through chats and video conferencing.'),
(7, 'Customer Support and Helpdesk Solutions', 'Ticketing systems and AI-driven chatbots for customer support management.'),
(8, 'E-commerce Platforms', 'Solutions for building, managing, and scaling online stores.'),
(9, 'Accounting and Financial Management', 'Tools for managing invoices, payroll, taxes, and financial reporting.'),
(10, 'Cybersecurity Services', 'Cloud-based security solutions for threat detection, vulnerability management, and data protection.');

select * from features;

--3. Insert into usage
INSERT INTO usage (usage_id, user_id, feature_id, usage_date, usage_duration_minutes)
VALUES
(1, 1, 1, '2024-01-01', 30),
(2, 1, 2, '2024-01-02', 45),
(3, 2, 3, '2024-01-03', 60),
(4, 2, 4, '2024-01-04', 90),
(5, 3, 5, '2024-01-05', 25),
(6, 3, 6, '2024-01-06', 40),
(7, 4, 7, '2024-01-07', 55),
(8, 4, 8, '2024-01-08', 65),
(9, 5, 9, '2024-01-09', 70),
(10, 5, 10, '2024-01-10', 35),
(11, 6, 1, '2024-01-11', 80),
(12, 6, 2, '2024-01-12', 45),
(13, 7, 3, '2024-01-13', 55),
(14, 7, 4, '2024-01-14', 65),
(15, 8, 5, '2024-01-15', 75),
(16, 8, 6, '2024-01-16', 90),
(17, 9, 7, '2024-01-17', 85),
(18, 9, 8, '2024-01-18', 60),
(19, 10, 9, '2024-01-19', 30),
(20, 10, 10, '2024-01-20', 40),
(21, 11, 1, '2024-01-21', 55),
(22, 11, 2, '2024-01-22', 75),
(23, 12, 3, '2024-01-23', 50),
(24, 12, 4, '2024-01-24', 70),
(25, 13, 5, '2024-01-25', 65),
(26, 13, 6, '2024-01-26', 45),
(27, 14, 7, '2024-01-27', 35),
(28, 14, 8, '2024-01-28', 55),
(29, 15, 9, '2024-01-29', 75),
(30, 15, 10, '2024-01-30', 85),
(31, 16, 1, '2024-02-01', 65),
(32, 16, 2, '2024-02-02', 30),
(33, 17, 3, '2024-02-03', 55),
(34, 17, 4, '2024-02-04', 40),
(35, 18, 5, '2024-02-05', 75),
(36, 18, 6, '2024-02-06', 45),
(37, 19, 7, '2024-02-07', 60),
(38, 19, 8, '2024-02-08', 50),
(39, 20, 9, '2024-02-09', 70),
(40, 20, 10, '2024-02-10', 90),
(41, 21, 1, '2024-02-11', 30),
(42, 21, 2, '2024-02-12', 45),
(43, 22, 3, '2024-02-13', 50),
(44, 22, 4, '2024-02-14', 60),
(45, 23, 5, '2024-02-15', 35),
(46, 23, 6, '2024-02-16', 55),
(47, 24, 7, '2024-02-17', 75),
(48, 24, 8, '2024-02-18', 90),
(49, 25, 9, '2024-02-19', 45),
(50, 25, 10, '2024-02-20', 55),
(51, 26, 1, '2024-02-21', 65),
(52, 26, 2, '2024-02-22', 75),
(53, 27, 3, '2024-02-23', 80),
(54, 27, 4, '2024-02-24', 60),
(55, 28, 5, '2024-02-25', 55),
(56, 28, 6, '2024-02-26', 45),
(57, 29, 7, '2024-02-27', 50),
(58, 29, 8, '2024-02-28', 30),
(59, 30, 9, '2024-02-29', 35),
(60, 30, 10, '2024-03-01', 60),
(61, 31, 1, '2024-03-02', 55),
(62, 31, 2, '2024-03-03', 75),
(63, 32, 3, '2024-03-04', 65),
(64, 32, 4, '2024-03-05', 90),
(65, 33, 5, '2024-03-06', 35),
(66, 33, 6, '2024-03-07', 45),
(67, 34, 7, '2024-03-08', 60),
(68, 34, 8, '2024-03-09', 85),
(69, 35, 9, '2024-03-10', 55),
(70, 35, 10, '2024-03-11', 65),
(71, 36, 1, '2024-03-12', 50),
(72, 36, 2, '2024-03-13', 40),
(73, 37, 3, '2024-03-14', 70),
(74, 37, 4, '2024-03-15', 90),
(75, 38, 5, '2024-03-16', 45),
(76, 38, 6, '2024-03-17', 65),
(77, 39, 7, '2024-03-18', 35),
(78, 39, 8, '2024-03-19', 50),
(79, 40, 9, '2024-03-20', 75),
(80, 40, 10, '2024-03-21', 80),
(81, 41, 1, '2024-03-22', 60),
(82, 41, 2, '2024-03-23', 70),
(83, 42, 3, '2024-03-24', 55),
(84, 42, 4, '2024-03-25', 90),
(85, 43, 5, '2024-03-26', 45),
(86, 43, 6, '2024-03-27', 65),
(87, 44, 7, '2024-03-28', 40),
(88, 44, 8, '2024-03-29', 60),
(89, 45, 9, '2024-03-30', 85),
(90, 45, 10, '2024-03-31', 75),
(91, 46, 1, '2024-04-01', 55),
(92, 46, 2, '2024-04-02', 50),
(93, 47, 3, '2024-04-03', 65),
(94, 47, 4, '2024-04-04', 80),
(95, 48, 5, '2024-04-05', 70),
(96, 48, 6, '2024-04-06', 90),
(97, 49, 7, '2024-04-07', 55),
(98, 49, 8, '2024-04-08', 45),
(99, 50, 9, '2024-04-09', 60),
(100, 50, 10, '2024-04-10', 50),
(101, 51, 1, '2024-04-11', 65),
(102, 51, 2, '2024-04-12', 30),
(103, 52, 3, '2024-04-13', 40),
(104, 52, 4, '2024-04-14', 55),
(105, 53, 5, '2024-04-15', 90),
(106, 54, 1, '2024-04-16', 40),
(107, 54, 2, '2024-04-17', 50),
(108, 55, 3, '2024-04-18', 60),
(109, 55, 4, '2024-04-19', 70),
(110, 56, 5, '2024-04-20', 80),
(111, 56, 6, '2024-04-21', 90),
(112, 57, 7, '2024-04-22', 45),
(113, 57, 8, '2024-04-23', 55),
(114, 58, 9, '2024-04-24', 65),
(115, 58, 10, '2024-04-25', 75),
(116, 59, 1, '2024-04-26', 30),
(117, 59, 2, '2024-04-27', 40),
(118, 60, 3, '2024-04-28', 50),
(119, 60, 4, '2024-04-29', 60),
(120, 61, 5, '2024-04-30', 70),
(121, 61, 6, '2024-05-01', 80),
(122, 62, 7, '2024-05-02', 90),
(123, 62, 8, '2024-05-03', 35),
(124, 63, 9, '2024-05-04', 45),
(125, 63, 10, '2024-05-05', 55),
(126, 64, 1, '2024-05-06', 65),
(127, 64, 2, '2024-05-07', 75),
(128, 65, 3, '2024-05-08', 85),
(129, 65, 4, '2024-05-09', 95),
(130, 66, 5, '2024-05-10', 30),
(131, 66, 6, '2024-05-11', 40),
(132, 67, 7, '2024-05-12', 50),
(133, 67, 8, '2024-05-13', 60),
(134, 68, 9, '2024-05-14', 70),
(135, 68, 10, '2024-05-15', 80),
(136, 69, 1, '2024-05-16', 45),
(137, 69, 2, '2024-05-17', 55),
(138, 70, 3, '2024-05-18', 65),
(139, 70, 4, '2024-05-19', 75),
(140, 71, 5, '2024-05-20', 85),
(141, 71, 6, '2024-05-21', 30),
(142, 72, 7, '2024-05-22', 40),
(143, 72, 8, '2024-05-23', 50),
(144, 73, 9, '2024-05-24', 60),
(145, 73, 10, '2024-05-25', 70),
(146, 74, 1, '2024-05-26', 80),
(147, 74, 2, '2024-05-27', 90),
(148, 75, 3, '2024-05-28', 35),
(149, 75, 4, '2024-05-29', 45),
(150, 76, 5, '2024-05-30', 55),
(151, 76, 6, '2024-06-01', 65),
(152, 77, 7, '2024-06-02', 75),
(153, 77, 8, '2024-06-03', 85),
(154, 78, 9, '2024-06-04', 95),
(155, 78, 10, '2024-06-05', 30),
(156, 79, 1, '2024-06-06', 40),
(157, 79, 2, '2024-06-07', 50),
(158, 80, 3, '2024-06-08', 60),
(159, 80, 4, '2024-06-09', 70),
(160, 81, 5, '2024-06-10', 80),
(161, 81, 6, '2024-06-11', 90),
(162, 82, 7, '2024-06-12', 35),
(163, 82, 8, '2024-06-13', 45),
(164, 83, 9, '2024-06-14', 55),
(165, 83, 10, '2024-06-15', 65),
(166, 84, 1, '2024-06-16', 75),
(167, 84, 2, '2024-06-17', 85),
(168, 85, 3, '2024-06-18', 30),
(169, 85, 4, '2024-06-19', 40),
(170, 86, 5, '2024-06-20', 50),
(171, 86, 6, '2024-06-21', 60),
(172, 87, 7, '2024-06-22', 70),
(173, 87, 8, '2024-06-23', 80),
(174, 88, 9, '2024-06-24', 90),
(175, 88, 10, '2024-06-25', 35),
(176, 89, 1, '2024-06-26', 45),
(177, 89, 2, '2024-06-27', 55),
(178, 90, 3, '2024-06-28', 65),
(179, 90, 4, '2024-06-29', 75),
(180, 91, 5, '2024-06-30', 85),
(181, 91, 6, '2024-07-01', 95),
(182, 92, 7, '2024-07-02', 30),
(183, 92, 8, '2024-07-03', 40),
(184, 93, 9, '2024-07-04', 50),
(185, 93, 10, '2024-07-05', 60),
(186, 94, 1, '2024-07-06', 70),
(187, 94, 2, '2024-07-07', 80),
(188, 95, 3, '2024-07-08', 90),
(189, 95, 4, '2024-07-09', 35),
(190, 96, 5, '2024-07-10', 45),
(191, 96, 6, '2024-07-11', 55),
(192, 97, 7, '2024-07-12', 65),
(193, 97, 8, '2024-07-13', 75),
(194, 98, 9, '2024-07-14', 85),
(195, 98, 10, '2024-07-15', 30),
(196, 99, 1, '2024-07-16', 40),
(197, 99, 2, '2024-07-17', 50),
(198, 100, 3, '2024-07-18', 60),
(199, 100, 4, '2024-07-19', 70),
(200, 101, 5, '2024-07-20', 80),
(201, 101, 6, '2024-07-21', 90),
(202, 102, 7, '2024-07-22', 35),
(203, 102, 8, '2024-07-23', 45),
(204, 103, 9, '2024-07-24', 55),
(205, 103, 10, '2024-07-25', 65),
(206, 104, 1, '2024-07-26', 75),
(207, 104, 2, '2024-07-27', 85),
(208, 105, 3, '2024-07-28', 95),
(209, 105, 4, '2024-07-29', 30);


select * from usage;


--4. Insert into subscription_payments
INSERT INTO subscription_payments (payment_id, user_id, payment_date, amount, subscription_plan) 
VALUES
(1, 1, '2024-01-01', 0.00, 'Free'),
(2, 2, '2024-01-02', 5000.00, 'Premium'),
(3, 3, '2024-01-03', 2000.00, 'Basic'),
(4, 4, '2024-01-04', 0.00, 'Free'),
(5, 5, '2024-01-05', 5000.00, 'Premium'),
(6, 6, '2024-01-06', 2000.00, 'Basic'),
(7, 7, '2024-01-07', 0.00, 'Free'),
(8, 8, '2024-01-08', 5000.00, 'Premium'),
(9, 9, '2024-01-09', 2000.00, 'Basic'),
(10, 10, '2024-01-10', 0.00, 'Free'),
(11, 11, '2024-01-11', 5000.00, 'Premium'),
(12, 12, '2024-01-12', 2000.00, 'Basic'),
(13, 13, '2024-01-13', 0.00, 'Free'),
(14, 14, '2024-01-14', 5000.00, 'Premium'),
(15, 15, '2024-01-15', 2000.00, 'Basic'),
(16, 16, '2024-01-16', 0.00, 'Free'),
(17, 17, '2024-01-17', 5000.00, 'Premium'),
(18, 18, '2024-01-18', 2000.00, 'Basic'),
(19, 19, '2024-01-19', 0.00, 'Free'),
(20, 20, '2024-01-20', 5000.00, 'Premium'),
(21, 21, '2024-01-21', 2000.00, 'Basic'),
(22, 22, '2024-01-22', 0.00, 'Free'),
(23, 23, '2024-01-23', 5000.00, 'Premium'),
(24, 24, '2024-01-24', 2000.00, 'Basic'),
(25, 25, '2024-01-25', 0.00, 'Free'),
(26, 26, '2024-01-26', 5000.00, 'Premium'),
(27, 27, '2024-01-27', 2000.00, 'Basic'),
(28, 28, '2024-01-28', 0.00, 'Free'),
(29, 29, '2024-01-29', 5000.00, 'Premium'),
(30, 30, '2024-01-30', 2000.00, 'Basic'),
(31, 31, '2024-01-31', 0.00, 'Free'),
(32, 32, '2024-02-01', 5000.00, 'Premium'),
(33, 33, '2024-02-02', 2000.00, 'Basic'),
(34, 34, '2024-02-03', 0.00, 'Free'),
(35, 35, '2024-02-04', 5000.00, 'Premium'),
(36, 36, '2024-02-05', 2000.00, 'Basic'),
(37, 37, '2024-02-06', 0.00, 'Free'),
(38, 38, '2024-02-07', 5000.00, 'Premium'),
(39, 39, '2024-02-08', 2000.00, 'Basic'),
(40, 40, '2024-02-09', 0.00, 'Free'),
(41, 41, '2024-02-10', 5000.00, 'Premium'),
(42, 42, '2024-02-11', 2000.00, 'Basic'),
(43, 43, '2024-02-12', 0.00, 'Free'),
(44, 44, '2024-02-13', 5000.00, 'Premium'),
(45, 45, '2024-02-14', 2000.00, 'Basic'),
(46, 46, '2024-02-15', 0.00, 'Free'),
(47, 47, '2024-02-16', 5000.00, 'Premium'),
(48, 48, '2024-02-17', 2000.00, 'Basic'),
(49, 49, '2024-02-18', 0.00, 'Free'),
(50, 50, '2024-02-19', 5000.00, 'Premium'),
(51, 51, '2024-02-20', 2000.00, 'Basic'),
(52, 52, '2024-02-21', 0.00, 'Free'),
(53, 53, '2024-02-22', 5000.00, 'Premium'),
(54, 54, '2024-02-23', 2000.00, 'Basic'),
(55, 55, '2024-02-24', 0.00, 'Free'),
(56, 56, '2024-02-25', 5000.00, 'Premium'),
(57, 57, '2024-02-26', 2000.00, 'Basic'),
(58, 58, '2024-02-27', 0.00, 'Free'),
(59, 59, '2024-02-28', 5000.00, 'Premium'),
(60, 60, '2024-02-29', 2000.00, 'Basic'),
(61, 61, '2024-03-01', 0.00, 'Free'),
(62, 62, '2024-03-02', 5000.00, 'Premium'),
(63, 63, '2024-03-03', 2000.00, 'Basic'),
(64, 64, '2024-03-04', 0.00, 'Free'),
(65, 65, '2024-03-05', 5000.00, 'Premium'),
(66, 66, '2024-03-06', 2000.00, 'Basic'),
(67, 67, '2024-03-07', 0.00, 'Free'),
(68, 68, '2024-03-08', 5000.00, 'Premium'),
(69, 69, '2024-03-09', 2000.00, 'Basic'),
(70, 70, '2024-03-10', 0.00, 'Free'),
(71, 71, '2024-03-11', 5000.00, 'Premium'),
(72, 72, '2024-03-12', 2000.00, 'Basic'),
(73, 73, '2024-03-13', 0.00, 'Free'),
(74, 74, '2024-03-14', 5000.00, 'Premium'),
(75, 75, '2024-03-15', 2000.00, 'Basic'),
(76, 76, '2024-03-16', 0.00, 'Free'),
(77, 77, '2024-03-17', 5000.00, 'Premium'),
(78, 78, '2024-03-18', 2000.00, 'Basic'),
(79, 79, '2024-03-19', 0.00, 'Free'),
(80, 80, '2024-03-20', 5000.00, 'Premium'),
(81, 81, '2024-03-21', 2000.00, 'Basic'),
(82, 82, '2024-03-22', 0.00, 'Free'),
(83, 83, '2024-03-23', 5000.00, 'Premium'),
(84, 84, '2024-03-24', 2000.00, 'Basic'),
(85, 85, '2024-03-25', 0.00, 'Free'),
(86, 86, '2024-03-26', 5000.00, 'Premium'),
(87, 87, '2024-03-27', 2000.00, 'Basic'),
(88, 88, '2024-03-28', 0.00, 'Free'),
(89, 89, '2024-03-29', 5000.00, 'Premium'),
(90, 90, '2024-03-30', 2000.00, 'Basic'),
(91, 91, '2024-04-01', 0.00, 'Free'),
(92, 92, '2024-04-02', 5000.00, 'Premium'),
(93, 93, '2024-04-03', 2000.00, 'Basic'),
(94, 94, '2024-04-04', 0.00, 'Free'),
(95, 95, '2024-04-05', 5000.00, 'Premium'),
(96, 96, '2024-04-06', 2000.00, 'Basic'),
(97, 97, '2024-04-07', 0.00, 'Free'),
(98, 98, '2024-04-08', 5000.00, 'Premium'),
(99, 99, '2024-04-09', 2000.00, 'Basic'),
(100, 100, '2024-04-10', 0.00, 'Free'),
(101, 101, '2024-04-11', 5000.00, 'Premium'),
(102, 102, '2024-04-12', 2000.00, 'Basic'),
(103, 103, '2024-04-13', 0.00, 'Free'),
(104, 104, '2024-04-14', 5000.00, 'Premium'),
(105, 105, '2024-04-15', 2000.00, 'Basic');


select * from subscription_payments;

--5. Insert into feedback

INSERT INTO feedback (feedback_id, user_id, feedback_date, rating, comments) VALUES
(1, 1, '2024-01-08', 9, 'Great platform, love the collaboration features!'),
(2, 2, '2024-01-21', 8, 'Good, but the video conferencing can be improved.'),
(3, 3, '2024-01-12', 10, 'Cancelled my subscription because I wasn’t using it enough.'),
(4, 4, '2024-01-01', 8, 'Very useful for managing tasks.'),
(5, 5, '2024-01-02', 9, 'Excellent features, but could use more customization options.'),
(6, 6, '2024-01-03', 7, 'Decent platform, but occasionally buggy.'),
(7, 7, '2024-01-04', 6, 'Not bad, but didn’t meet my expectations.'),
(8, 8, '2024-01-05', 9, 'Great tool for team communication.'),
(9, 9, '2024-01-06', 8, 'Good, but integration with other tools could be better.'),
(10, 10, '2024-01-07', 7, 'Satisfactory, but the user interface needs improvement.'),
(11, 11, '2024-01-08', 10, 'Fantastic platform! Highly recommend it.'),
(12, 12, '2024-01-09', 8, 'Useful features, but the support could be better.'),
(13, 13, '2024-01-10', 9, 'Great for collaboration and task management.'),
(14, 14, '2024-01-11', 7, 'Okay, but not as intuitive as I hoped.'),
(15, 15, '2024-01-12', 6, 'Average experience, looking for more features.'),
(16, 16, '2024-01-13', 8, 'Good for project management, but needs more integrations.'),
(17, 17, '2024-01-14', 9, 'Excellent platform with great features.'),
(18, 18, '2024-01-15', 7, 'Decent, but the mobile app needs improvements.'),
(19, 19, '2024-01-16', 6, 'Not very user-friendly.'),
(20, 20, '2024-01-17', 8, 'Solid tool for managing tasks and projects.'),
(21, 21, '2024-01-18', 9, 'Very helpful for team collaboration.'),
(22, 22, '2024-01-19', 8, 'Good features but a bit expensive.'),
(23, 23, '2024-01-20', 7, 'Okay, but I expected more from it.'),
(24, 24, '2024-01-21', 9, 'Great for organizing tasks and projects.'),
(25, 25, '2024-01-22', 10, 'Absolutely love it! Great for team management.'),
(26, 26, '2024-01-23', 7, 'Good tool, but it could use more customization.'),
(27, 27, '2024-01-24', 8, 'Nice features and easy to use.'),
(28, 28, '2024-01-25', 9, 'Excellent, but the onboarding process was confusing.'),
(29, 29, '2024-01-26', 8, 'Very useful, though the performance can lag sometimes.'),
(30, 30, '2024-01-27', 7, 'Decent platform, but not very intuitive.'),
(31, 31, '2024-01-28', 6, 'Not the best experience, but it has potential.'),
(32, 32, '2024-01-29', 8, 'Good for managing projects, but needs better support.'),
(33, 33, '2024-01-30', 9, 'Great tool with a lot of features.'),
(34, 34, '2024-01-31', 7, 'Okay, but the interface is not very user-friendly.'),
(35, 35, '2024-02-01', 8, 'Useful features, though a bit pricey.'),
(36, 36, '2024-02-02', 9, 'Excellent platform for team collaboration.'),
(37, 37, '2024-02-03', 6, 'Average tool, needs more improvements.'),
(38, 38, '2024-02-04', 8, 'Good features, but occasional glitches.'),
(39, 39, '2024-02-05', 7, 'Useful, but not very flexible.'),
(40, 40, '2024-02-06', 9, 'Great for managing projects and teams.'),
(41, 41, '2024-02-07', 10, 'Fantastic platform, exceeded my expectations.'),
(42, 42, '2024-02-08', 8, 'Good, but needs more integrations with other tools.'),
(43, 43, '2024-02-09', 7, 'Decent, but the features are somewhat limited.'),
(44, 44, '2024-02-10', 9, 'Very effective for project management.'),
(45, 45, '2024-02-11', 6, 'Not very intuitive, but functional.'),
(46, 46, '2024-02-12', 8, 'Solid tool with useful features.'),
(47, 47, '2024-02-13', 9, 'Great for organizing tasks and managing projects.'),
(48, 48, '2024-02-14', 7, 'Good, but the mobile version needs work.'),
(49, 49, '2024-02-15', 8, 'Useful for managing teams, but somewhat expensive.'),
(50, 50, '2024-02-16', 9, 'Excellent features and easy to use.'),
(51, 51, '2024-02-17', 6, 'Okay, but could be more user-friendly.'),
(52, 52, '2024-02-18', 8, 'Good platform with room for improvement.'),
(53, 53, '2024-02-19', 9, 'Great tool for managing projects and tasks.'),
(54, 54, '2024-02-20', 7, 'Decent, but not very intuitive.'),
(55, 55, '2024-02-21', 8, 'Useful for team collaboration, but needs more features.'),
(56, 56, '2024-02-22', 6, 'Average experience, needs improvement.'),
(57, 57, '2024-02-23', 9, 'Excellent for managing projects.'),
(58, 58, '2024-02-24', 7, 'Okay, but the interface could be better.'),
(59, 59, '2024-02-25', 8, 'Good, but could use more customization options.'),
(60, 60, '2024-02-26', 9, 'Great tool, very effective for team management.'),
(61, 61, '2024-02-27', 8, 'Useful, but the support needs improvement.'),
(62, 62, '2024-02-28', 7, 'Decent, but the onboarding process was confusing.'),
(63, 63, '2024-02-29', 8, 'Good features, but the platform is a bit slow.'),
(64, 64, '2024-03-01', 9, 'Excellent platform, highly recommend it.'),
(65, 65, '2024-03-02', 7, 'Okay, but could be more user-friendly.'),
(66, 66, '2024-03-03', 8, 'Good for managing projects, but could use more features.'),
(67, 67, '2024-03-04', 9, 'Great for team collaboration.'),
(68, 68, '2024-03-05', 6, 'Average tool, not very intuitive.'),
(69, 69, '2024-03-06', 8, 'Useful for task management, but needs better support.'),
(70, 70, '2024-03-07', 7, 'Decent, but the performance could be better.'),
(71, 71, '2024-03-08', 9, 'Fantastic tool for managing teams.'),
(72, 72, '2024-03-09', 8, 'Good platform, but could be improved.'),
(73, 73, '2024-03-10', 7, 'Okay, but the interface is not very user-friendly.'),
(74, 74, '2024-03-11', 9, 'Great for organizing tasks and projects.'),
(75, 75, '2024-03-12', 6, 'Not the best experience, needs improvement.'),
(76, 76, '2024-03-13', 8, 'Useful tool, though a bit pricey.'),
(77, 77, '2024-03-14', 9, 'Excellent platform for team collaboration.'),
(78, 78, '2024-03-15', 7, 'Decent, but could use more features.'),
(79, 79, '2024-03-16', 8, 'Good for managing projects, but needs better support.'),
(80, 80, '2024-03-17', 6, 'Average, but functional.'),
(81, 81, '2024-03-18', 9, 'Great tool for project management and team collaboration.'),
(82, 82, '2024-03-19', 7, 'Okay, but could be more intuitive.'),
(83, 83, '2024-03-20', 8, 'Useful, but has room for improvement.'),
(84, 84, '2024-03-21', 9, 'Excellent features, very effective.'),
(85, 85, '2024-03-22', 6, 'Average tool, needs more customization.'),
(86, 86, '2024-03-23', 8, 'Good, but could be more user-friendly.'),
(87, 87, '2024-03-24', 9, 'Great for managing tasks and projects.'),
(88, 88, '2024-03-25', 7, 'Decent, but not very intuitive.'),
(89, 89, '2024-03-26', 8, 'Useful, though the performance could be better.'),
(90, 90, '2024-03-27', 9, 'Excellent tool for collaboration and task management.'),
(91, 91, '2024-03-28', 6, 'Okay, but needs more features.'),
(92, 92, '2024-03-29', 8, 'Good platform, though the mobile app needs work.'),
(93, 93, '2024-03-30', 9, 'Great for team management and collaboration.'),
(94, 94, '2024-03-31', 7, 'Decent, but could be improved.'),
(95, 95, '2024-04-01', 8, 'Useful, but a bit expensive.'),
(96, 96, '2024-04-02', 9, 'Fantastic platform, highly recommend it.'),
(97, 97, '2024-04-03', 6, 'Average experience, needs improvements.'),
(98, 98, '2024-04-04', 8, 'Good for project management, but could be more intuitive.'),
(99, 99, '2024-04-05', 9, 'Excellent tool for team collaboration.'),
(100, 100, '2024-04-06', 7, 'Okay, but the features are somewhat limited.'),
(101, 101, '2024-04-07', 8, 'Useful, though the support could be better.'),
(102, 102, '2024-04-08', 9, 'Great for managing projects and teams.'),
(103, 103, '2024-04-09', 6, 'Average, needs more customization options.'),
(104, 104, '2024-04-10', 8, 'Good platform, though it’s a bit slow.'),
(105, 105, '2024-04-11', 9, 'Excellent features for task and project management.');
select * from feedback;





-- VIEW ALL DATABASES

select * from users;

select * from features;

select * from usage;

select * from subscription_payments;

select * from feedback;







































































































































