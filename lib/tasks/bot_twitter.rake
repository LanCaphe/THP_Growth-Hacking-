desc "Envoi de tweets aux journalistes !"
task bot_twitter: :environment do

  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
    config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
    config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
    config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
  end

  user = ["@youyoune61","@eddu61"]


  user.each do |single_user|
    begin
        random = rand(0..9)
        phrases = [
        "Bonjour #{single_user} , je suis élève à The Hacking Project une formation gratuite au code, viens découvrir cette formation sur https://growth-hacking-flers-lille.herokuapp.com/!",
        "Salut #{single_user}, vous connaissez The Hacking Project ? C’est une formation gratuite au code https://growth-hacking-flers-lille.herokuapp.com/ !" ,
        "Coucou #{single_user}, je vous contacte grâce un bot. Codé grâce à ma formation chez The Hacking project venez la découvrir https://growth-hacking-flers-lille.herokuapp.com/",
        "Hello #{single_user}, je vous envois ce message grâce à un bot appris durant ma formation The Hacking project (totalement gratuit!) plus d'info sur https://growth-hacking-flers-lille.herokuapp.com/",
        "#{single_user}, ce message est généré par un bot que j'ai appris a coder durant ma formation The Hacking Project https://growth-hacking-flers-lille.herokuapp.com/",
        "Bonjour #{single_user}, je vous présente mon bot twitter, codé durant ma formation The Hacking Project https://growth-hacking-flers-lille.herokuapp.com/",
        "Salut toi #{single_user}, vous connaissez mon bot twitter? Le voici ! Codé durant ma formation The Hacking project, totaly free découvrez la formation sur https://growth-hacking-flers-lille.herokuapp.com/ ",
        "Bonjour #{single_user}! Je suis un bot qui te spam par pur plaisir ! Made by The Hacking Project, une formation gratuite https://growth-hacking-flers-lille.herokuapp.com/",
        "Bot-'Toc toc' #{single_user}-'Qui est là?' Bot-'Je suis un bot codé durant une formation The Hacking Procject, totaly free ! découvre notre formation sur https://growth-hacking-flers-lille.herokuapp.com/",
        "Quoi #{single_user}, The Hacking Project te parle? Une formation gratuite qui t'apprend par exemple à faire des bots twitters! Découvre la formation ici https://growth-hacking-flers-lille.herokuapp.com/"]

        client.update(phrases[random])
        rescue Exception, NotFound, Forbidden
        next
    end
    sleep 87 #attend 87 secondes entre chaque tweets, pour ne pas dépasser les 100 tweet/h ni 1000 tweet/jour
  end
end
