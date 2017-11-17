-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2017 at 09:54 AM
-- Server version: 5.7.16-log
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `sl_no` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sl_no`, `password`, `username`) VALUES
(1, 'toor', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `admission_fees`
--

CREATE TABLE `admission_fees` (
  `sl_no` int(11) NOT NULL,
  `admission_fees_description` varchar(100) NOT NULL,
  `credit` float NOT NULL,
  `debit` float NOT NULL,
  `current_balance` float NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `balance_sheet`
--

CREATE TABLE `balance_sheet` (
  `sl_no` int(11) NOT NULL,
  `member_id` varchar(45) NOT NULL,
  `member_name` varchar(45) NOT NULL,
  `share_capital_ob` varchar(45) NOT NULL,
  `share_capital_cy` varchar(45) NOT NULL,
  `share_capital_cb` varchar(45) NOT NULL,
  `thrift_ob` varchar(45) NOT NULL,
  `thrift_cy` varchar(45) NOT NULL,
  `thrift_interest` varchar(45) NOT NULL,
  `thrift_cb` varchar(45) NOT NULL,
  `recurring_deposit_ob` varchar(45) NOT NULL,
  `recurring_deposit_cy` varchar(45) NOT NULL,
  `recurring_deposit_refund` varchar(45) NOT NULL,
  `recurring_deposit_cb` varchar(45) NOT NULL,
  `loan_outstanding` varchar(45) NOT NULL,
  `loan_interest_paid` varchar(45) NOT NULL,
  `rd_interest_received` varchar(45) NOT NULL,
  `fd_interest_received` varchar(45) NOT NULL,
  `admission_fees` varchar(45) NOT NULL,
  `dividend` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `balance_sheet`
--

INSERT INTO `balance_sheet` (`sl_no`, `member_id`, `member_name`, `share_capital_ob`, `share_capital_cy`, `share_capital_cb`, `thrift_ob`, `thrift_cy`, `thrift_interest`, `thrift_cb`, `recurring_deposit_ob`, `recurring_deposit_cy`, `recurring_deposit_refund`, `recurring_deposit_cb`, `loan_outstanding`, `loan_interest_paid`, `rd_interest_received`, `fd_interest_received`, `admission_fees`, `dividend`) VALUES
(1, '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2, '3543', 'Sandeep V', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(3, '3792', 'Karthik V Devaru', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `bank_interest_received_account`
--

CREATE TABLE `bank_interest_received_account` (
  `sl_no` int(11) NOT NULL,
  `bank_interest_received_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `canara_bank_sb_account_10815`
--

CREATE TABLE `canara_bank_sb_account_10815` (
  `sl_no` int(11) NOT NULL,
  `canara_bank_sb_account_10815_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dcf_account`
--

CREATE TABLE `dcf_account` (
  `sl_no` int(11) NOT NULL,
  `dcf_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dividend_account`
--

CREATE TABLE `dividend_account` (
  `sl_no` int(11) NOT NULL,
  `dividend_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fact_fd_at_bank_account`
--

CREATE TABLE `fact_fd_at_bank_account` (
  `sl_no` int(11) NOT NULL,
  `fact_fd_at_bank_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_interest_provision_account`
--

CREATE TABLE `fd_interest_provision_account` (
  `sl_no` int(11) NOT NULL,
  `fd_interest_provision_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_deposit_account`
--

CREATE TABLE `fixed_deposit_account` (
  `sl_no` int(11) NOT NULL,
  `fd_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_deposit_interest_paid`
--

CREATE TABLE `fixed_deposit_interest_paid` (
  `sl_no` int(11) NOT NULL,
  `fd_interest_paid_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `general_reserve_fund_account`
--

CREATE TABLE `general_reserve_fund_account` (
  `sl_no` int(11) NOT NULL,
  `general_reserve_fund_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `health_care_fund_account_and_bdf`
--

CREATE TABLE `health_care_fund_account_and_bdf` (
  `sl_no` int(11) NOT NULL,
  `health_care_fund_account_and_bdf_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `long_term_loan_account`
--

CREATE TABLE `long_term_loan_account` (
  `sl_no` int(11) NOT NULL,
  `long_term_loan_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `long_term_loan_interest_account_and_srvc_chrg_deduction`
--

CREATE TABLE `long_term_loan_interest_account_and_srvc_chrg_deduction` (
  `sl_no` int(11) NOT NULL,
  `ltlia_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loss_and_profit_approproation_account`
--

CREATE TABLE `loss_and_profit_approproation_account` (
  `sl_no` int(11) NOT NULL,
  `loss_and_profit_approproation_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `members_benevolent_fund_account`
--

CREATE TABLE `members_benevolent_fund_account` (
  `sl_no` int(11) NOT NULL,
  `members_benevolent_fund_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `members_rd_account`
--

CREATE TABLE `members_rd_account` (
  `sl_no` int(11) NOT NULL,
  `members_rd_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member_details`
--

CREATE TABLE `member_details` (
  `member_id` varchar(10) NOT NULL,
  `member_name` varchar(60) NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(450) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `sl_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member_details`
--

INSERT INTO `member_details` (`member_id`, `member_name`, `contact_number`, `email`, `address`, `dob`, `sl_no`) VALUES
('1', '1', '23', '2', '112132123', '123', 7),
('3543', 'Sandeep V', '888888887774', 'Sandeep.Vijayakumar@o2.com', '5fsdfdgdfg54d564d', '15151', 11),
('3792', 'Karthik V Devaru', '9964811558', 'devaru.karthik@gmail.com', 'asdsd5awrd5awe51wa5', '1994-05-20', 13);

-- --------------------------------------------------------

--
-- Table structure for table `miscellaneous_expense_account`
--

CREATE TABLE `miscellaneous_expense_account` (
  `sl_no` int(11) NOT NULL,
  `misc_expense_acc_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `penal_interest_account`
--

CREATE TABLE `penal_interest_account` (
  `sl_no` int(11) NOT NULL,
  `penal_interest_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `share_capital_account`
--

CREATE TABLE `share_capital_account` (
  `sl_no` int(11) NOT NULL,
  `sc_transaction_desc` varchar(200) NOT NULL,
  `sc_account_credit` varchar(45) NOT NULL,
  `sc_account_debit` varchar(45) NOT NULL,
  `sc_account_balance` varchar(45) NOT NULL,
  `transaction_date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `short_term_loan_account`
--

CREATE TABLE `short_term_loan_account` (
  `sl_no` int(11) NOT NULL,
  `short_term_loan_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `short_term_loan_interest_account_and_service_charge_deduction`
--

CREATE TABLE `short_term_loan_interest_account_and_service_charge_deduction` (
  `sl_no` int(11) NOT NULL,
  `stlia_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stationery_expense_account`
--

CREATE TABLE `stationery_expense_account` (
  `sl_no` int(11) NOT NULL,
  `stationery_expense_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `syndicate_bank_account`
--

CREATE TABLE `syndicate_bank_account` (
  `sl_no` int(11) NOT NULL,
  `syndicate_bank_account_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `thrift_account`
--

CREATE TABLE `thrift_account` (
  `sl_no` int(11) NOT NULL,
  `thrift_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `thrift_interest_paid`
--

CREATE TABLE `thrift_interest_paid` (
  `sl_no` int(11) NOT NULL,
  `thrift_int_paid_description` varchar(100) NOT NULL,
  `credit` varchar(45) NOT NULL,
  `debit` varchar(45) NOT NULL,
  `current_balance` varchar(45) NOT NULL,
  `transaction_timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `admission_fees`
--
ALTER TABLE `admission_fees`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `membership_no_UNIQUE` (`member_id`);

--
-- Indexes for table `bank_interest_received_account`
--
ALTER TABLE `bank_interest_received_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `canara_bank_sb_account_10815`
--
ALTER TABLE `canara_bank_sb_account_10815`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `dcf_account`
--
ALTER TABLE `dcf_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `dividend_account`
--
ALTER TABLE `dividend_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `fact_fd_at_bank_account`
--
ALTER TABLE `fact_fd_at_bank_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `fd_interest_provision_account`
--
ALTER TABLE `fd_interest_provision_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `fixed_deposit_account`
--
ALTER TABLE `fixed_deposit_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `fixed_deposit_interest_paid`
--
ALTER TABLE `fixed_deposit_interest_paid`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `general_reserve_fund_account`
--
ALTER TABLE `general_reserve_fund_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `health_care_fund_account_and_bdf`
--
ALTER TABLE `health_care_fund_account_and_bdf`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `long_term_loan_account`
--
ALTER TABLE `long_term_loan_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `long_term_loan_interest_account_and_srvc_chrg_deduction`
--
ALTER TABLE `long_term_loan_interest_account_and_srvc_chrg_deduction`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `loss_and_profit_approproation_account`
--
ALTER TABLE `loss_and_profit_approproation_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `members_benevolent_fund_account`
--
ALTER TABLE `members_benevolent_fund_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `members_rd_account`
--
ALTER TABLE `members_rd_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `member_details`
--
ALTER TABLE `member_details`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `member_id_UNIQUE` (`member_id`);

--
-- Indexes for table `miscellaneous_expense_account`
--
ALTER TABLE `miscellaneous_expense_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `penal_interest_account`
--
ALTER TABLE `penal_interest_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `share_capital_account`
--
ALTER TABLE `share_capital_account`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `sl_no_UNIQUE` (`sl_no`);

--
-- Indexes for table `short_term_loan_account`
--
ALTER TABLE `short_term_loan_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `short_term_loan_interest_account_and_service_charge_deduction`
--
ALTER TABLE `short_term_loan_interest_account_and_service_charge_deduction`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `stationery_expense_account`
--
ALTER TABLE `stationery_expense_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `syndicate_bank_account`
--
ALTER TABLE `syndicate_bank_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `thrift_account`
--
ALTER TABLE `thrift_account`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `thrift_interest_paid`
--
ALTER TABLE `thrift_interest_paid`
  ADD PRIMARY KEY (`sl_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admission_fees`
--
ALTER TABLE `admission_fees`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bank_interest_received_account`
--
ALTER TABLE `bank_interest_received_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `canara_bank_sb_account_10815`
--
ALTER TABLE `canara_bank_sb_account_10815`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dcf_account`
--
ALTER TABLE `dcf_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dividend_account`
--
ALTER TABLE `dividend_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fact_fd_at_bank_account`
--
ALTER TABLE `fact_fd_at_bank_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fd_interest_provision_account`
--
ALTER TABLE `fd_interest_provision_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fixed_deposit_account`
--
ALTER TABLE `fixed_deposit_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fixed_deposit_interest_paid`
--
ALTER TABLE `fixed_deposit_interest_paid`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `general_reserve_fund_account`
--
ALTER TABLE `general_reserve_fund_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `health_care_fund_account_and_bdf`
--
ALTER TABLE `health_care_fund_account_and_bdf`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `long_term_loan_account`
--
ALTER TABLE `long_term_loan_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `long_term_loan_interest_account_and_srvc_chrg_deduction`
--
ALTER TABLE `long_term_loan_interest_account_and_srvc_chrg_deduction`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `loss_and_profit_approproation_account`
--
ALTER TABLE `loss_and_profit_approproation_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `members_benevolent_fund_account`
--
ALTER TABLE `members_benevolent_fund_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `members_rd_account`
--
ALTER TABLE `members_rd_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member_details`
--
ALTER TABLE `member_details`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `miscellaneous_expense_account`
--
ALTER TABLE `miscellaneous_expense_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penal_interest_account`
--
ALTER TABLE `penal_interest_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `share_capital_account`
--
ALTER TABLE `share_capital_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `short_term_loan_account`
--
ALTER TABLE `short_term_loan_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `short_term_loan_interest_account_and_service_charge_deduction`
--
ALTER TABLE `short_term_loan_interest_account_and_service_charge_deduction`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stationery_expense_account`
--
ALTER TABLE `stationery_expense_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syndicate_bank_account`
--
ALTER TABLE `syndicate_bank_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `thrift_account`
--
ALTER TABLE `thrift_account`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `thrift_interest_paid`
--
ALTER TABLE `thrift_interest_paid`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
