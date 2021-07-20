class GraphController < ApplicationController
  include PeersHelper

  def show
    render 'graph/show', locals: {
      nodes: get_nodes.to_json,
      links: get_links.to_json
    }
  end

  def show2
    render 'graph/show2', locals: {
      nodes: get_nodes,
      links: get_links
    }
  end

  def json
    render json: {
      nodes: get_nodes,
      links: get_links
    }
  end

  private

  def get_nodes
    interfaces = []
    Interface.all.map { |i| interfaces << {
        name: i.name,
        key: i.key.name,
        id: i.id
      }
    }
    interfaces
  end

  def get_links
    peers = []
    Peer.all.map { |p| peers << {
        source: p.interface.id,
        target: reciprocal_peer(p).interface.id,
        weight: 1
      }
    }
    peers
  end

end
