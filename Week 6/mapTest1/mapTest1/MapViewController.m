//
//  MapViewController.m
//  mapTest1
//
//  Created by Leo Font on 6/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "CoolBarList.h"
#import <AVFoundation/AVFoundation.h>


@interface MapViewController () <MKMapViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textSearch;

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (nonatomic, strong) NSArray* coolBars;

@property (nonatomic, strong) CLLocation *selectedLocation;

@property (weak, nonatomic) IBOutlet UISwitch *modeSwitch;

@property (nonatomic, strong) NSMutableArray *cameras;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cameras = [[NSMutableArray alloc]init];
    
    self.map.showsUserLocation = YES;
    
    self.coolBars = [CoolBarList allCoolBarsFromPlist];
    
    [self addPins];
    
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







- (IBAction)center:(UIBarButtonItem *)sender {
    
    // Hand made coords
  //  CLLocationCoordinate2D myCoord  = CLLocationCoordinate2DMake(40.4167,-3.7037);
    
    // Or use real user coords
    CLLocationCoordinate2D myCoord = self.map.userLocation.coordinate;
    
    NSLog(@"My pos %f % f",self.map.userLocation.coordinate.latitude,self.map.userLocation.coordinate.longitude);
    
    
    MKCoordinateRegion viewRegion =
    MKCoordinateRegionMakeWithDistance(myCoord, 10, 10);
    
    MKCoordinateRegion adjustedRegion = [self.map regionThatFits:viewRegion];
    
    [self.map setRegion:adjustedRegion animated:YES];
    
 
}

- (void)centerMap:(MKMapView *)map
     InCoordinate:(CLLocationCoordinate2D)coordinate {
   
    MKCoordinateRegion viewRegion =
    MKCoordinateRegionMakeWithDistance(coordinate, 10, 10);
    
    MKCoordinateRegion adjustedRegion = [self.map regionThatFits:viewRegion];

    [map setRegion:adjustedRegion animated:YES];
}


#pragma mark Action Map View Delegates

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
//    NSLog(@"Location changed");
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 1000.0f, 1000.0f);
//    MKCoordinateRegion adjustedRegion = [self.map regionThatFits:region];
//
//    [self.map setRegion:adjustedRegion animated:YES];
    
    
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{

  NSLog(@"Region changed");

}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {

//    if (mapView.visibleMapRect.size.width > 10000) {
//               return nil;
//    }

    MKAnnotationView* mkView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"myCoolBars"];
    
    
    
    if (!mkView) {
            mkView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myCoolBars"];
        
             }
    
 
    if (annotation == mapView.userLocation) {
       
        mkView.image = [UIImage imageNamed:@"21-skull.png"];
        
    } else if ([annotation isKindOfClass:[CoolBar class]]) {
    
        CoolBar *bar = (CoolBar *)annotation;
        
         [mkView setCanShowCallout:YES];
         mkView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
    
        switch (bar.type) {
                
            case classic_bar:
                mkView.image = [UIImage imageNamed:@"21-skull.png"];
                break;
            case discoteque:
                mkView.image = [UIImage imageNamed:@"08-chat.png"];
                break;
            case piano_bar:
                mkView.image = [UIImage imageNamed:@"10-medical.png"];
                break;
            case tapas_bar:
                mkView.image = [UIImage imageNamed:@"21-skull.png"];
                break;
            default:
                mkView.image = [UIImage imageNamed:@"10-medical.png"];
                break;
        }
    
 
    }
    
    
    

    return mkView;
}


- (void)mapView:(MKMapView *)mapView
didAddAnnotationViews:(NSArray *)annotationViews
{
    for (MKAnnotationView *annView in annotationViews)
    {
        CGRect endFrame = annView.frame;
        annView.frame = CGRectOffset(endFrame, 0, -500);
        [UIView animateWithDuration:2
                         animations:^{ annView.frame = endFrame; }];
    }
}


#pragma mark Actions

- (IBAction)changeMapType:(UIBarButtonItem *)sender {
    
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"Map Type"
                                                    delegate:self
                                           cancelButtonTitle:@"Ok"
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:@"Satellite", @"Standard", @"Hybrid", nil];
    
    
    [as showInView:self.view];

    
    
}

#pragma mark Action Sheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
  
    switch (buttonIndex) {
        case 0:
            [self.map setMapType:MKMapTypeSatellite];
            break;
        case 1:
            [self.map setMapType:MKMapTypeStandard];
            break;
        case 2:
            [self.map setMapType:MKMapTypeHybrid];
            break;
            
        default:
            break;
    }
}


#pragma mark notations

-(void)addPins{
    
    [self.map removeAnnotations:[self.map annotations]];
    
    [self.map addAnnotations:self.coolBars];
    

    
}

#pragma mark annotations delegate

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    
        NSLog(@"calloud tapped");
    
}
    
-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
    
        NSLog(@"pin %@",[view description]);
        
        
}


#pragma mark Textfield delegate

- (BOOL)textField:(UITextField*)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString*)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        
        if (self.modeSwitch.isOn) {
            [self localSearch:string];
        } else {
            [self geolocateAddress:self.textSearch.text];
            
        }
        return NO;
    }
    
    
    return YES;
}


#pragma mark local Search 

- (void)localSearch:(NSString *)searchString {
    
    MKLocalSearchRequest *searchRequest = [[MKLocalSearchRequest alloc] init];
    [searchRequest setNaturalLanguageQuery:searchString];
    [searchRequest setRegion:[self.map region]];
    
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:searchRequest];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        if (!error) {
            NSLog(@"Response! %lu",response.mapItems.count);
            NSLog(@"Response! %@",response.mapItems);
            
            for (MKMapItem *poi in response.mapItems) {
            
                CoolBar *bar = [[CoolBar alloc] init];
                bar.name = poi.name;
                bar.coordinate = poi.placemark.coordinate;
                
                [self.map addAnnotation:bar];
            
            }
            
        }
    }];
        
}


#pragma  mark geocode 
- (void)geolocateAddress:(NSString *)address {
    
    NSMutableDictionary *placeDictionary = [[NSMutableDictionary alloc] init];
    NSArray *keys = @[@"Street", @"City"];
    NSArray *addressComponents  = [address componentsSeparatedByString:@","];

    if (addressComponents.count == 2) {
        [addressComponents enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [placeDictionary setObject:obj forKey:keys[idx]];
        }];
    }
    
     CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder geocodeAddressDictionary:placeDictionary completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if([placemarks count]) {
        
            CLPlacemark *placemark = [placemarks firstObject];
            CLLocation *location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;

             [self centerMap:self.map InCoordinate:coordinate];
        
        }
    
    }];
    
    
}




#pragma mark Reverse geocode

- (IBAction)mapTap:(id)sender {
    
 
    
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    CGPoint tapPoint = [tap locationInView:self.map];
    
    CLLocationCoordinate2D coord = [self.map convertPoint:tapPoint
                                     toCoordinateFromView:self.map];
    
    
    self.selectedLocation = [[CLLocation alloc] initWithLatitude:coord.latitude longitude:coord.longitude];
   
    [self reverseGeocodeLocation];

}

-(void)reverseGeocodeLocation {
    
    NSLog(@"Coord %f",self.selectedLocation.coordinate.latitude);
    NSLog(@"Coord %f",self.selectedLocation.coordinate.longitude);

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:self.selectedLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if(placemarks.count){
            NSDictionary *dictionary = [[placemarks objectAtIndex:0] addressDictionary];
            NSDictionary *surfaceDictionary = [dictionary valueForKey:@"Street"];
            
            NSMutableString *reverseGeocodedAddress;
            //Check if land
            if (surfaceDictionary){
                
                reverseGeocodedAddress = [NSMutableString stringWithFormat:@"%@", [dictionary valueForKey:@"Street"]];
                
                [reverseGeocodedAddress appendString:[dictionary valueForKey:@"City"]];
                [reverseGeocodedAddress appendString:[dictionary valueForKey:@"State"]];
                [reverseGeocodedAddress appendString:[dictionary valueForKey:@"ZIP"]];
                
            } else {
                reverseGeocodedAddress = [NSMutableString stringWithFormat:@"%@", [dictionary valueForKey:@"Name"]];
                [reverseGeocodedAddress appendString:[dictionary valueForKey:@"Ocean"]];
                
            }
            
            
            self.textSearch.text = reverseGeocodedAddress;
            
            [self calculateRoute];
            
            
        }
    }];
    
}





#pragma mark Cameras
- (IBAction)travel:(id)sender {
    
    for (CoolBar *bar in self.coolBars) {
     
         [self addCameraUsingBar:bar];
        
    }
    
    [self gotoNextCamera];

    
}
    

- (void)addCameraUsingBar:(CoolBar *)bar {
   
    MKMapCamera *camera = [MKMapCamera cameraLookingAtCenterCoordinate:bar.coordinate
                                                     fromEyeCoordinate:bar.coordinate eyeAltitude:100];
    
    [camera setPitch:60];

    [self.cameras addObject:camera];
    
    
    
}



- (void)gotoNextCamera {
   
    if (self.cameras.count == 0) {
        return;
    }
    
    MKMapCamera *nextCamera = [self.cameras firstObject];
    [self.cameras removeObjectAtIndex:0];
    
    [UIView animateWithDuration:2.5 delay:1.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.map setCamera:nextCamera];
                     }
                     completion:^(BOOL finished) {
                         [self gotoNextCamera];
                         
                     }
     ];
    
    
    
}







-(void)calculateRoute {
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    request.transportType = MKDirectionsTransportTypeWalking;
    
    MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:self.selectedLocation.coordinate  addressDictionary:nil] ;
    
    MKMapItem *destinationMapItem = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
    
    request.destination = destinationMapItem;
    
    request.requestsAlternateRoutes = YES;
    
    MKDirections *directions =
    [[MKDirections alloc] initWithRequest:request];
    
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         
         if (error) {
             // Handle Error
         } else {
             

             [self showRoute:response];
         }
         
     }];
}





#pragma mark Routes

- (IBAction)calculateRoute:(id)sender {
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];

    request.source = [MKMapItem mapItemForCurrentLocation];

    request.transportType = MKDirectionsTransportTypeWalking;

    MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:self.selectedLocation.coordinate  addressDictionary:nil] ;
    
    MKMapItem *destinationMapItem = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
    
    request.destination = destinationMapItem;
    
    request.requestsAlternateRoutes = YES;

    MKDirections *directions =
    [[MKDirections alloc] initWithRequest:request];

    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         
         if (error) {
             // Handle Error
         } else {
             [self showRoute:response];
         }
         
    }];
    
    
   }


-(void)showRoute:(MKDirectionsResponse *)response
{
    for (MKRoute *route in response.routes){
        
        [self.map
         addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in route.steps){
            
            NSLog(@"%@", step.instructions);
            
            AVSpeechUtterance *utterance = [AVSpeechUtterance
                                            speechUtteranceWithString:step.instructions];
        
            AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
            [synth speakUtterance:utterance];

        }
        
    }
    
    
    
}


- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
   
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 5.0;
    return renderer;
    

}

@end
