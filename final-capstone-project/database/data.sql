-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO app_user(user_name, password, role, salt) VALUES ('BillBoBraggins', '12345', 'user' , 'idk');
INSERT INTO app_user(user_name, password, role, salt) VALUES ('Frodo', 'HarryFeet', 'user' , 'idk');
INSERT INTO app_user(user_name, password, role, salt) VALUES ('Jason', 'SummerChoppn', 'user' , 'idk');
INSERT INTO app_user(user_name, password, role, salt) VALUES ('HelloKity', '12345', 'admin' , 'idk');
INSERT INTO app_user(user_name, password, role, salt) VALUES ('Mike_Jones', '281330', 'user' , 'idk');




INSERT INTO deck (user_id, deckName, deckDescription) 
VALUES  (1,  'Math', 'Basic Math Terms'),
        (1,  'Geometry', 'Basic Geometry Terms'),
        (1,  'Ohio History', 'Facts about Ohio'),
        (1,  'Citizenship', 'Sample US Citizenship Questions'),
        (1,  'Presidents', 'How well do you know your Presidents?'),
        (1,  'Habitats', 'Homes for Life'),
        (1,  'Beer', 'Proof that God wants us to be happy'),
        (1,  'Java', 'Introductory Java Terms'),
        (1,  'Chemistry', 'The Central Science'),
        (1,  'Earth Science', 'Shaping of our Earth');



INSERT INTO note_card (deck_id, question, answer)
VALUES (1, 'An operation in which we combine two numbers to make a larger one.', 'Addition'),
       (1, 'An operation in which we take away 1 number from another to get a smaller number', 'Subtraction'),
       (1, 'An operation used for the shortening of repeated addition', 'Multiplication'),
       (1, 'An operation in which we make parts out of a number, which are equal', 'Division'),
       (1, 'The same in number, amount, degree, rank or quality', 'Equal'),
       (1, 'A word or symbol that stands for a specific amount or quantity', 'Number'),
       (1, 'The bottom number in a fraction, how many pieces are in the whole', 'Denominator'),
       (1, 'A number with one or more digits to the right of the decimal point', 'Decimal'),
       (1, 'The Answer to a multiplication problem', 'Product'),
       (1, 'Place value one place right of the decimal', 'Tenth Place'),
       (2, 'Number of square units required to cover a surface', 'Area'),
       (2, 'The distance around a shape', 'Perimeter'),
       (2, 'Lines in the same plane that never intersect', 'Parallel'),
       (2, 'A quadrilateral with 4 sides and 4 right angles', 'Rectangle'),
       (2, 'A quadrilateral with exactly one pair of parallel sides', 'Trapezoid'),
       (2, 'Polygon with three sides', 'Triangle'),
       (2, 'An object with six equal faces', 'Cube'),
       (2, 'Three sided polygon with two equal sides', 'Isosceles Triangle'),
       (2, 'A parallelogram with four equal sides', 'Rhombus'),
       (2, 'A quadrilateral with two pairs of parallel sides', 'Parallelogram'),
       (3, 'Invented the Airplane', 'Orville & Wilbur Wright'),
       (3, 'Invented the Lightbulb and Phonograph', 'Thomas Edison'),
       (3, '9th US President served only 31 days in office', 'William Harrison'),
       (3, 'The first capital of Ohio', 'Chillicothe'),
       (3, 'State Bird', 'Cardinal'),
       (3, 'Forms a large portion of Ohios Northern Boarder', 'Lake Erie'),
       (3, 'Ohios second capital city', 'Zanesville'),
       (3, 'How many State flags are not rectangular?', 'Only One, O - H - I - O'),
       (3, 'State Tree', 'Buckeye'),
       (3, '18th President, Union Army General', 'Ulysses S. Grant'),
       (4, 'Protects our rights, defines our government', 'The Constitution'),
       (4, 'Idea of self-government represented by the first three words of The Constitution', 'We the people'),
       (4, 'The first ammendment protects', 'Religeon, Speech, Assembly'),
       (4, 'How many amendments are in the Constitution', '27'),
       (4, 'Anounced independece from England, July 4th, 1776', 'Declaration of Independence'),
       (4, 'Change or addition to the Constitution', 'Amendment'),
       (4, 'Three branches of government include...', 'Judiciary, Legislative, Executive'),
       (4, 'Stops one branch of government from becoming too powerful', 'Buckeye'),
       (4, 'Highest Court in the land', 'Supreme Court'),
       (4, 'Name of first ten amendments of the Constitution', 'Bill of Rights'),
       (5, '43rd President who is also an avid painter', 'George w. Bush'),
       (5, 'Though politically gifted, he will forever be associated with the Watergate scandal and his resignation.', 'Richard Nixon'),
       (5, 'Held office during the onset of the Great Depression', 'Herbert Hoover'),
       (5, 'Served only 30 days as president', 'William Harrison'),
       (5, 'He survived impeachment after opposing Reconstruction initiatives including the 14th amendment.', 'Andrew Johnson'),
       (5, 'July 4th, 1826th was the death of these two men and the 50th anniversary of the Declaration of Independence', 'John Adams & Thomas Jefferson'),
       (5, 'Issued the Emancipation Proclomation', 'Abraham Lincoln'),
       (5, 'Three term President, implemented New Deal', 'Franklin D. Roosevelt'),
       (5, '"The conservation president", enacted Antiquities Act', 'Theodore Roosevelt'),
       (5, 'Created The National Parks Service', 'Woodrow Wilson'),
       (5, 'Principal author of Declaration of Independence and 3rd President', 'Thomas Jefferson'),
       (5, 'Commander of the Continental Army during American Revolutionary War', 'George Washington'),
       (6, 'Large, flat, treeless land', ' Tundra'),
       (6, 'Open land covered wth grass used for grazing', ' Grassland'),
       (6, 'Fresh water of a river meets the salt water of the ocean.', ' Estuary'),
       (6, 'A forest containing trees that lose their leaves each year', ' Deciduous Forest'),
       (6, 'A ridge made up of skeletal remains of tiny sea animals', ' Coral Reef'),
       (6, 'Very dry area with little water and few plants', ' Desert'),
       (6, 'Dense forest that receives high amounts of rain each year', ' Rain Forest'),
       (6, 'Deep underwater canyon', ' Trench'),
       (6, 'Large body of salt water', ' Ocean'),
       (6, 'Inundated by water, either permanently or seasonally, where oxygen-free processes prevail', ' Wetlands'),
       (7, 'Light and easy to drink with very little aftertaste. Sometimes hazy or cloudy with a touch of spice notes.', ' Wheat'),
       (7, 'Fruity, copper-coloured, originiating from England. Robust beers that can be enjoyed with strongly spiced foods.', ' Pale Ale'),
       (7, 'Tend to be golden in colour with a dry, crisp, and somewhat bitter flavour. Stands out from other lagers due to its more distinctive hop taste.', ' Pilsner'),
       (7, 'Sweet to bitter and pale to black, is usually used to describe bottom-fermented brews of Dutch, German, and Czech styles.', ' Lager'),
       (7, 'Dark, almost black, fruity-dry, top fermenting style', ' Porter'),
       (7, 'Dark, almost black, rich, creamy head, slightly astringent, coffee-like character', 'Stout'),
       (7, 'Golden to copper color, intense hop flavor and aroma  ', ' IPA'),
       (7, 'Oldest alcoholic drinks, fermented with honey, water, and yeast ', ' Mead'),
       (7, 'Fermented through exposure to wild yeasts and bacteria, distinct dry, cidery, with sour aftertaste', ' Lambic'),
       (7, 'Saison is a pale ale that is highly carbonated, fruity, spicy, and often bottle conditioned', 'Saison'),
       (8, 'Holds some known or unknown amount of information referred to as a value', 'Variable'),
       (8, 'Attribute of data which tells compiler how to use the data', 'Data Type'),
       (8, 'Part of a statement used as is, rather than as a variable', 'Literal'),
       (8, 'Occurs when converting from  a type with more size to less', 'Narrowing'),
       (8, 'Character that represents an action', 'Operator'),
       (8, 'Operator for Not Equal To', '!='),
       (8, 'Joining two strings together', 'Concatenation'),
       (8, 'Code which can be evaluated to produce a result', 'Expression'),
       (8, 'Forms a complete unit of execution, like a sentence', 'Statement'),
       (8, 'Code that needs to belong together as a single unit, permits multiple statements to be grouped together', 'Block'),
       (9, 'Smallest form of matter that has a unique set of properties and cant be broken down', 'Element'),
       (9, 'Blend of two or more substances that are not chemically combined', 'Mixture'),
       (9, 'Substance that contains two or more elements chemically combined in a fixed proportion', 'Compound'),
       (9, 'Compound that produces hydrogen ions(H+) in solution', 'Acid'),
       (9, 'Produces hydroxide ions(OH-) in solution', 'Base'),
       (9, 'Average mass of all the naturally occurring isotopes of an element', 'Atomic Mass'),
       (9, 'Sum of the protons and neutrons in the nucleus', 'Mass Number'),
       (9, 'Mumber of protons in the nucleus', 'Atomic Number'),
       (9, 'Dense Subatomic particle located in the nucleus', 'Neutron'),
       (9, 'Negatively charged subatomic particle in a cloud around the nucleus', 'Electron'),
       (10, 'Positively charged subatomic partcile inside the nucleus', 'Proton'),
       (10, 'The breaking down of sediment', 'Weathering'),
       (10, 'The movement of sediment', 'Erosion'),
       (10, 'The depositing or settling of sediment', 'Deposition'),
       (10, 'Earths outer shell, referred to the Lithosphere', 'Tectonic Plate'),
       (10, 'Creates mid ocean ridges and rift valleys', 'Divergent Plate Boundary'),
       (10, 'Creates faults, responsible for earthquakes', 'Transform Plate Boundary'),
       (10, 'Creates mountains, tenches, island arcs', 'Convergent PLate Boundary'),
       (10, 'Pangea', 'Supercontinent'),
       (10, 'Theory that Earths continents are in motion', 'Continental Drift'),
       (10, 'Scientist who proposed Continental Drift', 'Alfred Wegener');

COMMIT;
