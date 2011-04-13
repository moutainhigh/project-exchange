
CREATE TABLE `fp_leader_help` (
  `id` bigint(20) NOT NULL,
  `family_id` bigint(20) DEFAULT NULL,
  `leader_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
