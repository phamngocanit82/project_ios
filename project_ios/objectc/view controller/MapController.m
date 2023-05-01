#import "MapController.h"
#import <GoogleMaps/GoogleMaps.h>
@interface MapController ()
@end
@implementation MapController
- (void)viewDidLoad {
    [super viewDidLoad];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                              longitude:151.20
                                                                   zoom:6];
    GMSMapView *mapView = [GMSMapView mapWithFrame:self.view.frame camera:camera];
    mapView.myLocationEnabled = YES;
    [self.view addSubview:mapView];

    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView;
}
-(void)viewDidDisappear:(BOOL)animated{

}
@end
