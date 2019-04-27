# Created by Michael Cahana in late Apr. 2019
# Visualize GOT bracket scores

#===========
# inputs: 
#===========
# scores.csv

#===========
# needed libraries
#===========
library(tidyverse)

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

scores <- read_csv(file.path(results, 'scores.csv'))

#===========
# leaderboard
#===========

leaderboard <- 
	scores %>% 
	group_by(contestant) %>% 
	summarize(points = sum(points)) %>% 
	arrange(points) %>% 
	setNames(c('Contestant', 'Points')) 

#===========
# time series
#===========

time_series <- 
	scores %>% 
	ggplot(aes(x = episode, y = points, color = contestant)) +
	geom_point() + 
	geom_line() +
	labs(x = 'Episode', y = 'Points', 
		title = 'Week by Week Rankings',
		color = 'Contestant') +
	theme(plot.title = element_text(hjust = 0.5)) +
	scale_x_continuous(breaks = seq(3, 5))

#===========
# save output
#===========

write_csv(leaderboard, file.path(results, 'leaderboard.csv'))
ggsave(file.path(results, 'time_series.png'), plot = time_series)