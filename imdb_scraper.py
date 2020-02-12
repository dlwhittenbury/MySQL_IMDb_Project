# Simple IMDb scraper functions:
#
#     - Get poster url for a given title_id, e.g., 'tt0165362'
#         title_id = 'tt0165362'
#         bs = get_title_webpage(title_id)
#         poster_link = get_imdb_title_poster_url(bs)


from bs4 import BeautifulSoup
from urllib.request import urlopen

# test title_id
#title_id = 'tt0165362'
#https://m.media-amazon.com/images/M/MV5BMzk0NTE1MDA1NF5BMl5BanBnXkFtZTgwOTIxMDAxNDE@._V1_UY268_CR8,0,182,268_AL_.jpg
# title_id = 'tt0354593'
# https://m.media-amazon.com/images/M/MV5BOGM0Yzk1NzYtZjQzMC00OWViLTkzYmEtNGRiNzkxZDc4NjJkXkEyXkFqcGdeQXVyNzI1NzMxNzM@._V1_UY268_CR18,0,182,268_AL_.jpg

def get_title_webpage(title_id):
    """Given an IMDb title_id this function will return the title's webpage as
    a BeautifulSoup object."""

    # Construct url for title
    title_url = 'https://www.imdb.com/title/' + title_id

    # Get the HTML of the title's IMDb page
    html = urlopen(title_url)

    # Create a BeautifulSoup object
    bs = BeautifulSoup(html,"html.parser")

    return bs


def get_imdb_title_poster_url(bs):
    """Given a BeautifulSoup object of a title's IMDb webpage this function will
    return the url for its poster."""

    # Extract poster link
    data = bs.find('div',{'class':'poster'})
    poster_link = data.img['src']

    return poster_link
