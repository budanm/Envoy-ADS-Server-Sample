package ads

import (
	"context"
	"fmt"
	v2 "github.com/envoyproxy/go-control-plane/envoy/api/v2"
	"log"

)



type AdsCallbacks struct {
}

// OnStreamOpen is called once an xDS stream is open with a stream ID and the type URL (or "" for ADS).
// Returning an error will end processing and close the stream. OnStreamClosed will still be called.
func (c *AdsCallbacks) OnStreamOpen(ctxt context.Context, streamid int64, typeurl string) error {
	log.Printf("OnStreamOpen %d: %s\n", streamid, typeurl)
	return nil
}

// OnStreamClosed is called immediately prior to closing an xDS stream with a stream ID.
func (c *AdsCallbacks) OnStreamClosed(streamid int64) {
	log.Printf("OnStreaOnStreamClosedmOpen %d\n", streamid)
}

//ConfigError ConfigError
type ConfigError struct {
	msg string
}

//NewConfigError NewConfigError
func NewConfigError(msg string) error {
	return &ConfigError{msg: msg}
}
func (err *ConfigError) Error() string {
	return err.msg
}

// OnStreamRequest is called once a request is received on a stream.
// Returning an error will end processing and close the stream. OnStreamClosed will still be called.
func (c *AdsCallbacks) OnStreamRequest(streamid int64, req *v2.DiscoveryRequest) error {
	log.Printf("OnStreamRequest Node : %v <---> StreamId :  %d <----> TypeUrl : %s <---> VersionInfo : %v <---> Request Res Names : %v <----> Nonce : %v \n", req.Node.Id, streamid, req.TypeUrl, req.VersionInfo, req.ResourceNames, req.ResponseNonce)
	if req.ErrorDetail != nil {
		log.Printf("OnStreamRequest Error Node : %v <---> StreamId : %d <---> Error : Code -> %v <------> Message -> %v <---------> Details -> %v", req.Node.Id, streamid, req.ErrorDetail.Code, req.ErrorDetail.Message, req.ErrorDetail.Details)
		return NewConfigError(fmt.Sprintf("OnStreamRequest Error Node : %v <---> StreamId : %d <---> Error : %v", req.Node.Id, streamid, req.ErrorDetail))
	}
	return nil
}

// OnStreamResponse is called immediately prior to sending a response on a stream.
func (c *AdsCallbacks) OnStreamResponse(streamid int64, req *v2.DiscoveryRequest, res *v2.DiscoveryResponse) {
	log.Printf("OnStreamResponse Node : %v <---> StreamId : %d <----> TypeUrl : %s <---> VersionInfo :  %v <---> Nonce : %v \n", req.Node.Id, streamid, req.TypeUrl,  res.VersionInfo, res.Nonce)
}

// OnFetchRequest is called for each Fetch request. Returning an error will end processing of the
// request and respond with an error.
func (c *AdsCallbacks) OnFetchRequest(ctxt context.Context, req *v2.DiscoveryRequest) error {
	log.Printf("%v : OnFetchRequest %s\n", req.Node.Id, req.TypeUrl)
	if req.ErrorDetail != nil {
		log.Printf("%v : Fetch Request Error in : %v", req.Node.Id, req.ErrorDetail)
		return NewConfigError(fmt.Sprintf("%v : Fetch Request Error in : %v", req.Node.Id, req.ErrorDetail))
	}
	return nil
}

// OnFetchResponse is called immediately prior to sending a response.
func (c *AdsCallbacks) OnFetchResponse(req *v2.DiscoveryRequest, res *v2.DiscoveryResponse) {
	log.Printf("OnFetchResponse %s, %s\n", req.TypeUrl, res.TypeUrl)
}

