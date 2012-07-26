create extension plpython3u;

create function pycmc (cost text)
       returns integer
as $$
   import re
   cmc = 0
   match = re.match('(\d*)([wubrgWURBG]*)', cost)
   if len(match.group(1)) > 0:
      cmc += int(match.group(1))
   cmc += len(match.group(2))
   return cmc
$$ language plpython3u;

CREATE TABLE cards (
       name text primary key,
       cost text,
       type text
);

create table players (
       id serial primary key,
       name text
);

create table decks (
       deck_id serial primary key,
       player_id integer,
       name text
);

create table cards_in_deck (
       deck_id integer,
       quantity integer,
       card_name text,
       constraint deck_exists foreign key (deck_id) 
       		  references decks (deck_id),
       constraint card_exists foreign key (card_name)
       		  references cards (name)
);


create view decklists as
       select name, card_name, quantity
       from decks natural join cards_in_deck;
