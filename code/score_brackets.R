# Created by Michael Cahana in late Apr. 2019
# Scores GOT bracket predictions according to master bracket

#===========
# inputs: 
#===========
# brackets dir
# master.xlsx

#===========
# needed libraries
#===========
library(tidyverse)
library(readxl)

#===========
# standard setup
#===========
root <- getwd()
while(basename(root) != "got_death_bracket") {
  root <- dirname(root)
}
source(file.path(root, "data.R"))

#===========
# data read in
#===========

character_outcomes <- read_excel(file.path(dropbox, 'master.xlsx'))
bracket_predictions <- 
	list.files(brackets, full.names = T) %>% 
	map_df(read_excel)
bracket_contestants <- 
	list.files(brackets) %>% 
	str_replace('.xlsx', '') %>% 
	str_to_title()

#===========
# data reshaping
#===========

character_outcomes <- 
	character_outcomes %>% 
	select(Characters:`Episode 6`) %>% 
	setNames(c('character', 'episode_3', 'episode_4', 
		'episode_5', 'episode_6')) %>% 
	gather(episode, outcome, episode_3:episode_6) %>% 
	mutate(episode = str_extract(episode, '\\d'))

bracket_predictions <- 
	bracket_predictions %>% 
	select(Characters:`Episode 6`) %>% 
	setNames(c('character', 'episode_3', 'episode_4', 
		'episode_5', 'episode_6')) %>% 
	mutate(contestant = rep(bracket_contestants, each=32)) %>% 
	gather(episode, prediction, episode_3:episode_6) %>% 
	mutate(episode = str_extract(episode, '\\d'))

#===========
# generate scores
#===========

scores <- 
	bracket_predictions %>% 
	left_join(character_outcomes, by = c('character', 'episode')) %>% 
	filter(!is.na(outcome)) %>% 
	mutate(points = if_else(prediction==outcome, 1, 0)) %>% 
	group_by(contestant, episode) %>% 
	summarize(points = sum(points, na.rm = T)) %>% 
	mutate(cum_points = cumsum(points))

#===========
# save outout
#===========

write_csv(scores, file.path(results, 'scores.csv'))

