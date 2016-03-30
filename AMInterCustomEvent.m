//
//  AMInterCustomEvent.m
//  mcivik
//
//  Created by mcivik on 26/11/14.
//  Copyright (c) 2014 mcivik. All rights reserved.
//

#import "AMInterCustomEvent.h"

@implementation AMInterCustomEvent

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info
{
    
    self.amazonAdView = [AmazonAdInterstitial amazonAdInterstitial];
    
    // Register the ViewController with the delegate to receive callbacks.
    self.amazonAdView.delegate = self;
    
    AmazonAdOptions *options = [AmazonAdOptions options];

#if DEBUG
//        options.isTestRequest = YES;
#endif
    
    // Load an interstitial
    [self.amazonAdView load:options];
    
}

#pragma mark - AmazonAdInterstitialDelegate
- (void)interstitialDidLoad:(AmazonAdInterstitial *)interstitial
{

    [app activate_interstitial_window];
    
    [self.amazonAdView presentFromViewController:app.alertWindow.rootViewController];
    
    
    [self.delegate interstitialCustomEvent:self didLoadAd:interstitial];
    
}

- (void)interstitialDidFailToLoad:(AmazonAdInterstitial *)interstitial withError:(AmazonAdError *)error
{
    NSLog(@"Interstitial failed to load. %@", error.errorDescription);
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:nil];
    
}

- (void)interstitialWillPresent:(AmazonAdInterstitial *)interstitial
{
    NSLog(@"Interstitial will be presented.");
    [self.delegate interstitialCustomEventWillAppear: self];
}

- (void)interstitialDidPresent:(AmazonAdInterstitial *)interstitial
{
    [self.delegate interstitialCustomEventDidAppear: self];

}

- (void)interstitialWillDismiss:(AmazonAdInterstitial *)interstitial
{
    NSLog(@"Interstitial will be dismissed.");
    [app deactivate_interstitial_window];
    [self.delegate interstitialCustomEventWillDisappear: self];

}

- (void)interstitialDidDismiss:(AmazonAdInterstitial *)interstitial
{
    NSLog(@"Interstitial has been dismissed.");
        [self.delegate interstitialCustomEventDidDisappear:self];
}

@end
