class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart=["chuby","busty","bigtits"]



  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    nreq = Rack::Request.new(env)
    if nreq.path.match(/cart/)
      @@cart.each do |cart|
        resp.write"#{cart}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"

      
    end
    

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      @@cart.push(search_term)
    else
      return "Couldn't find #{search_term}"
    end
  end
end
