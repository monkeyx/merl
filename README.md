# merl
A Multi-User Dungeon (MUD) in Erlang/OTP

This is an experimental project to create a MUD using Erlang/OTP.

## Current Status

Nothing playable.

## Dependencies

* Erlang / OTP
* Erlang.mk for building the project
* See [`Makefile`](Makefile) for package dependencies

## Components

### Players

Players are at the heart of things. They connect, spawning sessions around their character. Their characters and login information should be persisted between sessions.

Each player is a player character and therefore has some name, race, character class, a bunch of items, abilities and other properties.

Players interact with the world via commands which are parsed and then executed.

Players can also chat with other players in the same area.

### Areas

Areas connect a bunch of locales together and altogether form the game world.

Each area has a chat channel which players can talk with each other on.

Areas may have zero or more behaviours that apply to all locales inside the area.

### Locales

Each locale can be a room, or something else, inside an area and connected to other locales via exits.

Locales have players, objects and mobs inside them.

They may have zero or more behaviours that cause some effect to occur on (mobs / objects / players) inside the locale. They may also inherit behaviours from the area they belong to.

### Exits

Exits connect one locale to another. 

They may have zero or more behaviours that cause some effect to occur on (mobs / objects / players) using the exit.

### Objects

Objects are items that exist independently within a locale.

They can be seen by players or mobs inside the locale.

They have zero or more behaviours that cause some effect to occur when they are looked at, used, picked up or attacked.

### Mobs

Mobs are behaviour-driven mobile objects that are spawned inside locales and have abilities so can perform a subset of the actions that a player can perform such as moving, talking, attacking, trading, inspecting, stealing etc.

Mobs like players have a race and character class and an inventory of items.

### Items

Items are types of objects which can exist inside locales or in the inventory of players or mobs. Some are able to be used or equipped.

### Behaviours

Behaviours come in several flavours but share certain characteristics:

**Triggers**: Behaviours have triggers which are checked on the potential targets of the behaviour.

**Effects**: Behaviours can cause effects if they are triggered. These can be one-shot effects, temporary or permanent.

#### Area / Locale Behaviours

These behaviours trigger on players, mobs and objects entering or leaving locales.

#### Rational State Behaviours 

These behaviours trigger under certain circumstances against players, mobs or objects detected by mobs.

#### Random Behaviours

These behaviours trigger randomly on mobs suspectible to them unless specific conditions fail.

### Character Classes

A character class gives a player or mob a set of abilities which they can use.

Players can use gained experience to improve the level of a character class or to gain new character classes.

### Races

A race gives a player or mob a set of abilities which they can use. 

Unlike character classes, races cannot be levelled by players.

### Abilities

Abilities describe what a player or mob is capable of doing. 

Abilities may have ranks which are unlocked by character class at set levels or specific races.

Abilities may enable certain commands to be used or allow commands to be used in a specific way.

There are several broad categories of abilities

#### Passive

Passive abilities do not require a command to trigger and are in effect, permanent effects on the player or mob.

#### Skill

Skills are usually used indirectly in determining the success of various commands.

#### Magic

Magic abilities are spells that can be *cast* by some character classes using *mana points*.

#### Psionics

Psionic abilities are like spells in that they can be *cast* by some character classes but they use *psy points*.

#### Songs

Song abilities can be used by the *sing* command and bring about some effect much like spells, however, they do not deplete mana or psy points. However, a character can only sing one song at a time.

#### Poison and Disease

Poison and disease abilities produce a negative effect on the target of any attack by the player or mob.

Their difference is solely in terms of immunnities and curing them with other abilities.

#### Traps

Traps are a type of ability that cause an effect when the mob is interacted with in some way. They basically allow the modelling of trap mobs.

#### Language

Languages are abilities that allow players to talk to mobs and each other.

### Parser and Commands

Commands are parsed and issued by players.

### Host

- Manages client connections 
- Use Player component to manage AAA
- Use Parser component to handle input

## To Dos
