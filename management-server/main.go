package main

import (
	"context"
	"envoymanagementserver/ads"
	"envoymanagementserver/cachebuilder"
	"time"
)



func main() {

	ctx := context.Background()
	xds := &ads.XdsServer{Address: ":18000"}
	xds.RunServer()

	xdssnapshotcache := xds.GetSnapshotCache()
	envoyCacheBuilder := cachebuilder.NewCacheBuilder(time.Duration(10)*time.Second, xdssnapshotcache)
	go envoyCacheBuilder.Run()

	<-ctx.Done()


}
