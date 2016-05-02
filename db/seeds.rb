@posts = ['https://i.redditmedia.com/uHQE_ZXgVznwwo5LYrf49cYI3zRm_9UXfQIIgoJnfnc.jpg?s=ea5ba5f658fdc6e6498d6c3303a0741b','https://i.redditmedia.com/DrwXvGhUBBLqoUPvrbQiilfIs6Jf2Ggyu5abmL2WMpo.jpg?s=00cd29e6211f087e65899d3d45978c21','https://scontent.fsjc1-3.fna.fbcdn.net/hphotos-xtp1/v/t1.0-9/13006610_1135913519804332_9038259206750858309_n.jpg?oh=c1b13aff115569c136390ccfaadb1c40&oe=57AA4739','http://i.imgur.com/qvEUXtv.jpg','http://s2.quickmeme.com/img/9c/9c7afde423c79b528b3509c49add3897bce04059008865a4ad3e7d841e17472e.jpg', 'http://i.imgur.com/HCCNH51.png','http://i.imgur.com/AndJHWC.png','http://i.imgur.com/aiaRm6y.png','http://i.imgur.com/ueWmO6j.png','http://i.imgur.com/lpC1D9B.jpg','https://media.makeameme.org/created/didnt-learn-basic.jpg','http://i.imgur.com/y2CirPg.jpg','http://i.imgur.com/EqUznmf.jpg','http://i.imgur.com/qNP1LBW.jpg','http://1.bp.blogspot.com/-L0PDP9bhpWM/UxRljSBcruI/AAAAAAAAYWs/wPE9GseLurY/s1600/wall.jpg','http://i.imgur.com/gDvygYX.png','http://i.imgur.com/Uzjd8sy.png','http://i.imgur.com/vLlwUFM.jpg','https://i.imgur.com/YfFty0c.jpg','http://i.imgur.com/DigRtic.png']
@posts.each do |post|
  new_meme = Meme.new(url: post, height: 600, width: 600)
  new_meme.save
end



# @posts = RedditKit.links 'adviceanimals', :category => :top, :time => :week
# @posts.results.each do |post|
#   if post.attributes[:preview][:images][0][:source][:height] <= 600
#     new_meme = Meme.new(url: post.attributes[:preview][:images][0][:source][:url], height: post.attributes[:preview][:images][0][:source][:height], width: post.attributes[:preview][:images][0][:source][:width])
#     new_meme.save
#   end
# end

# @posts = RedditKit.links 'adviceanimals', :category => :top, :time => :month
# @posts.results.each do |post|
#   if post.attributes[:preview][:images][0][:source][:height] <= 600
#     new_meme = Meme.new(url: post.attributes[:preview][:images][0][:source][:url], height: post.attributes[:preview][:images][0][:source][:height], width: post.attributes[:preview][:images][0][:source][:width])
#     new_meme.save
#   end
# end

# @posts = RedditKit.links 'adviceanimals', :category => :top, :time => :year
# @posts.results.each do |post|
#   if post.attributes[:preview][:images][0][:source][:height] <= 600
#     new_meme = Meme.new(url: post.attributes[:preview][:images][0][:source][:url], height: post.attributes[:preview][:images][0][:source][:height], width: post.attributes[:preview][:images][0][:source][:width])
#     new_meme.save
#   end
# end
