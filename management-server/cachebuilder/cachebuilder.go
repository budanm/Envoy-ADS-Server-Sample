package cachebuilder

import (
	"envoymanagementserver/entities"
	"fmt"
	"github.com/envoyproxy/go-control-plane/pkg/cache"
	"log"
	"os"
	"strconv"
	"time"
)

const nodeID = "test-id"
var count = 0
var maxcount = 1
var testSnapshot = entities.TestSnapshot{
	Xds:              entities.Ads,
	UpstreamPort:     80,
	BasePort:         18090,
	NumClusters:      4,
	NumHTTPListeners: 2,
	NumTCPListeners:  0,
	NumRuntimes:      0,
	TLS:              false,
}

type CacheBuilder struct {
	Stopped            bool                // A flag determining the state of the worker
	ShutdownChannel    chan string         // A channel to communicate to the routine
	Interval           time.Duration       // The interval with which to run the Action
	period             time.Duration       // The actual period of the wait
	envoySnapshotCache cache.SnapshotCache //Mainting the snapshotcache for the envoy
}

// NewWorker creates a new worker and instantiates all the data structures required.
func NewCacheBuilder(interval time.Duration, snapshotCache cache.SnapshotCache) *CacheBuilder {
	maxcount, _ = strconv.Atoi(os.Getenv("MAX_SNAPSHOT_ITERATIONS"))
	return &CacheBuilder{
		Stopped:            false,
		ShutdownChannel:    make(chan string),
		Interval:           interval,
		period:             interval,
		envoySnapshotCache: snapshotCache,
	}
}

func (w *CacheBuilder) Run() {

	log.Println("Cache Builder Started")

	// Loop that runs forever
	for {
		select {
		case <-w.ShutdownChannel:
			w.ShutdownChannel <- "Down"
			log.Println("Shutting down polling")
			return
		case <-time.After(w.period):
			// This breaks out of the select, not the for loop.
			break
		}

		started := time.Now()
		w.Action()
		finished := time.Now()

		duration := finished.Sub(started)
		w.period = w.Interval - duration

	}

}

func (w *CacheBuilder) Action() {

	if count <  maxcount {
		testSnapshot.Version = fmt.Sprintf("v%d", count)
		log.Printf("update snapshot %v\n", testSnapshot.Version)

		snapshot := testSnapshot.Generate()
		if err := snapshot.Consistent(); err != nil {
			log.Printf("snapshot inconsistency: %+v\n", snapshot)
		}

		err := w.envoySnapshotCache.SetSnapshot(nodeID, snapshot)
		if err != nil {
			log.Printf("snapshot error %q for %+v\n", err, snapshot)
			os.Exit(1)
		}
		count = count + 1
	}
}
