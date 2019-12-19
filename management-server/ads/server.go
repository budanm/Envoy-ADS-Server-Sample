package ads

import (
	"log"
	"net"

	discovery "github.com/envoyproxy/go-control-plane/envoy/service/discovery/v2"
	"github.com/envoyproxy/go-control-plane/pkg/cache"
	xds "github.com/envoyproxy/go-control-plane/pkg/server"

	core "github.com/envoyproxy/go-control-plane/envoy/api/v2/core"

	"google.golang.org/grpc"
)

type nodeHasher struct {
}

// ID function
func (h nodeHasher) ID(node *core.Node) string {
	if node == nil {
		return "unknown"
	}
	return node.Id
}

//XdsServer XdsServer
type XdsServer struct {
	Address string
	Cache   cache.SnapshotCache
}

func (xdserver *XdsServer) GetSnapshotCache() cache.SnapshotCache{
	return xdserver.Cache
}


//RunServer RunServer
func (xdsserver *XdsServer) RunServer() error {

	// gRPC golang library sets a very small upper bound for the number gRPC/h2
	// streams over a single TCP connection. If a proxy multiplexes requests over
	// a single connection to the management server, then it might lead to
	// availability problems.
	var grpcOptions []grpc.ServerOption
	grpcOptions = append(grpcOptions, grpc.MaxConcurrentStreams(1000000))
	grpcServer := grpc.NewServer(grpcOptions...)
	//grpcServer := initializeGRPCServer()

	lis, err := net.Listen("tcp", xdsserver.Address)

	if err != nil {
		log.Println(err)
		return err
	}

	snapshotCache := cache.NewSnapshotCache(true, nodeHasher{}, nil)

	server := xds.NewServer(snapshotCache, &AdsCallbacks{})
	discovery.RegisterAggregatedDiscoveryServiceServer(grpcServer, server)
	discovery.RegisterSecretDiscoveryServiceServer(grpcServer, server)


	xdsserver.Cache = snapshotCache
	log.Println("[CONTROL PLANE] : Starting Ads server on " + xdsserver.Address)
	go func() {
		if err := grpcServer.Serve(lis); err != nil {
			// error handling
			log.Printf("[CONTROL PLANE] : Error %v \n", err)
			log.Println("[CONTROL PLANE] : error starting control plane Ads server Error : " + err.Error())

		}
	}()



	//grpcServer.GracefulStop()
	return nil
}