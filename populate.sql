copy cards from '/Users/kossoffj/learning/postgres/cards3.txt'
     with delimiter '|';

insert into players (name) values ('Josh');
insert into players (name) values ('Steve');
insert into players (name) values ('Mike');
insert into players (name) values ('Brian');
insert into players (name) values ('Tim');
insert into players (name) values ('Joe');


insert into decks (player_id, name) values (
       (select id from players where name = 'Josh'),
       'Rock');
insert into decks (player_id, name) values (
       (select id from players where name = 'Josh'),
       'MBC');
insert into decks (player_id, name) values (
       (select id from players where name = 'Mike'),
       'Orzhov');
insert into decks (player_id, name) values (
       (select id from players where name = 'Tim'),
       'Zombies');
insert into decks (player_id, name) values (
       (select id from players where name = 'Steve'),
       'WBR Reanimator');
insert into decks (player_id, name) values (
       (select id from players where name = 'Brian'),
       'Faeries');
insert into decks (player_id, name) values (
       (select id from players where name = 'Joe'),
       'Vampires');

insert into cards_in_deck (deck_id, card_name, quantity) values (
       (select deck_id from decks where name = 'Rock'),
       'Pelakka Wurm',
       2);
insert into cards_in_deck (deck_id, card_name, quantity) values (
       (select deck_id from decks where name = 'Rock'),
       'Vampire Nighthawk',
       4);
insert into cards_in_deck (deck_id, card_name, quantity) values (
       (select deck_id from decks where name = 'Rock'),
       'Viridian Emissary',
       4);

insert into cards_in_deck (deck_id, card_name, quantity) values (
       (select deck_id from decks where name = 'Faeries'),
       'Oona''s Prowler',
       4);
