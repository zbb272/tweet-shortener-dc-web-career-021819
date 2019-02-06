def dictionary 
  dictionary_hash = {
    "hello" => "hi", "to" => "2", "two" => "2", "too" => "2", "for" => "4",
    "four" => "4", "be" => "b", "you" => "u", "at" => "@", "and" => "&"
  }
end 

def word_substituter(tweet)
  new_tweet = []
  tweet.split(" ").each do | word |
    new_tweet << word
    dictionary.each do | old_word, new_word |
      if word.downcase == old_word
        new_tweet.pop
        new_tweet << new_word
      end 
    end 
  end 
  new_tweet.join(" ")
end 

def bulk_tweet_shortener(tweets)
  tweets.each do | tweet |
    puts word_substituter(tweet)
  end 
end 

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else 
    tweet
  end 
end 

def shortened_tweet_truncator(tweet)
  new_tweet = selective_tweet_shortener(tweet)[0..140]
  if new_tweet.length > 140 
    new_tweet = new_tweet[0..136] + "..."
  end 
  new_tweet
end 