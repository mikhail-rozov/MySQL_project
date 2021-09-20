INSERT `sc2_project`.`user` (`email`) VALUES 
    ('cali45@example.org'),
    ('myles.nienow@example.com'),
    ('mhilll@example.org'),
    ('gzulauf@example.com'),
    ('eddie.douglas@example.com'),
    ('maverick46@example.net'),
    ('smonahan@example.org'),
    ('isabelle52@example.net'),
    ('romaine29@example.net'),
    ('francesco01@example.net');

INSERT `sc2_project`.`league` (id, `name`) VALUES 
    (0, 'Not placed'),
    (1, 'Bronze'),
    (2, 'Silver'),
    (3, 'Gold'),
    (4, 'Platinum'),
    (5, 'Diamond'),
    (6, 'Master'),
    (7, 'Grandmaster');

INSERT `sc2_project`.`race` (id, `name`) VALUES 
    (1, 'Terran'),
    (2, 'Zerg'),
    (3, 'Protoss');

INSERT `sc2_project`.`profile` (user_id, nickname, first_name, last_name, league_id, mmr, updated_at) VALUES 
    (1, 'cali45', 'Melvina', 'Eichmann', 3, 1300, null),
    (2, 'Myles N', 'Myles', 'Nienow', 1, 600, '2021-05-06 16:23:31'),
    (3, 'mhill', 'Alisa', 'Trantow', 5, 2600, null),
    (4, 'gzulauf', 'Aubree', 'Lemke', 3, 1450, '2020-10-23 03:00:54'),
    (5, 'eddieD', 'Eddie', 'Douglas', 0, 0, null),
    (6, 'maverick46', 'Barney', 'Kovacek', 2, 1100, null),
    (7, 'smonahan', 'Malinda', 'Bernhard', 6, 3300, '2021-02-08 15:11:33'),
    (8, 'isabelle52', 'Madge', 'Bosco', 4, 2050, null),
    (9, 'romaine29', 'Sid', 'Daniel', 7, 6200, null),
    (10, 'francesco01', 'Talia', 'Homenick', 6, 3600, null);

INSERT `sc2_project`.`friend_request` (`from_user_id`, `to_user_id`, `status`) VALUES 
    (3, 2, 0),
    (5, 6, 1),
    (5, 2, 0),
    (4, 6, -1),
    (6, 7, 1),
    (7, 9, 1),
    (5, 3, 0),
    (4, 3, 1),
    (6, 8, -1),
    (1, 3, 1);

INSERT `sc2_project`.`message` (`from_user_id`, `to_user_id`, `message`, `is_read`) VALUES 
    (4, 7, 'Consequatur ut eveniet unde mollitia.', b'0'),
    (7, 5, 'Quaerat quia ducimus est possimus porro enim.', b'1'),
    (2, 6, 'Placeat aliquid saepe autem debitis qui et.', b'1'),
    (6, 2, 'Hic doloremque rem dolores vero dolorem dolor maxime dignissimos.', b'0'),
    (7, 8, 'Labore exercitationem praesentium id sunt quas.', b'1'),
    (6, 1, 'Iste ducimus sequi voluptatem expedita hic ex iusto.', b'1'),
    (2, 3, 'Dolores in ut laudantium blanditiis quas ipsam doloremque dolores.', b'0'),
    (7, 9, 'Quaerat minus ipsum voluptas aspernatur assumenda iusto.', b'1'),
    (10, '3', 'Sed nobis delectus tenetur alias facere porro.', b'0'),
    (3, '6', 'Id tempora asperiores ut quae tenetur harum dicta.', b'1');

INSERT `sc2_project`.`map` (`name`, `metadata`, `path`, `ladder_map`) VALUES 
    ('Romanticide', '{\"players\": \"2\", \"size\": \"96x64\"}', 'model/vnd.gdl', b'1'),
    ('Jagannatha', '{\"players\": \"2\", \"size\": \"64x108\"}', 'application/vnd.syncml+xml', b'1'),
    ('Fighting spirit', '{\"players\": \"4\", \"size\": \"108x108\"}', 'application/x-msdownload', b'0'),
    ('Efflorescence', '{\"players\": \"4\", \"size\": \"108x108\"}', 'application/vnd.ezpix-package', b'1'),
    ('Lost temple', '{\"players\": \"4\", \"size\": \"128x128\"}', 'image/x-xpixmap', b'0'),
    ('Nightscape', '{\"players\": \"4\", \"size\": \"128x128\"}', 'audio/x-pn-realaudio-plugin', b'1'),
    ('Distant platform', '{\"players\": \"2\", \"size\": \"64x64\"}', 'application/x-blorb', b'0'),
    ('Augustine fall', '{\"players\": \"6\", \"size\": \"178x128\"}', 'text/x-uuencode', b'1'),
    ('Concord', '{\"players\": \"8\", \"size\": \"256x256\"}', 'application/vnd.lotus-approach', b'1');

INSERT `sc2_project`.`match` (`player_1_id`, `player_2_id`, `player_1_race_id`, `player_2_race_id`, `map_id`, `match_duration`, `played_at`, `player_won`, `player_1_mmr_change`, `player_2_mmr_change`) VALUES
    (10, 6, 1, 2, 7, '15:40', '2021-03-22 11:08', 2, -2, 6),
    (2, 7, 3, 3, 8, '09:16', '2021-02-13 16:24', 2, -7, 10),
    (5, 1, 3, 1, 2, '21:02', '2021-05-21 04:50', 1, 5, -18),
    (10, 2, 3, 3, 5, '08:39', '2020-06-04 01:19', 1, 7, -15),
    (9, 6, 1, 1, 5, '17:00', '2021-02-17 01:02', 1, 13, -9),
    (7, 1, 3, 3, 8, '06:12', '2021-05-21 09:45', 1, 14, -18),
    (10, 3, 2, 2, 1, '06:12', '2020-10-15 04:10', 2, -10, 11),
    (6, 5, 1, 3, 5, '01:31', '2021-03-28 21:59', 1, 15, -9),
    (1, 5, 3, 3, 4, '13:22', '2021-06-10 18:06', 2, -9, 15),
    (2, 10, 1, 2, 5, '10:17', '2020-09-26 16:08', 1, 16, -2);

INSERT `sc2_project`.`achievement` (id, points_given) VALUES
    (1, 50),
    (2, 30),
    (3, 50),
    (4, 60),
    (5, 20),
    (6, 30),
    (7, 10),
    (8, 10),
    (9, 60),
    (10, 30);

INSERT `sc2_project`.`achievement_user` (achievement_id, profile_user_id, achieved_at) VALUES
    (3, 7, '2020-11-01 07:09:57'),
    (9, 2, '2020-07-19 09:46:52'),
    (8, 3, '2021-04-27 15:18:16'),
    (4, 2, '2021-03-24 16:17:41'),
    (2, 7, '2021-03-14 04:18:55'),
    (4, 8, '2021-05-11 15:16:57'),
    (2, 6, '2020-12-14 15:30:19'),
    (2, 2, '2020-11-10 21:14:30'),
    (9, 6, '2021-05-12 00:27:54'),
    (5, 3, '2020-10-20 21:23:20');