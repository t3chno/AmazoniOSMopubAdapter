//
//  AMBannerCustomEvent.m
//  mcivik
//
//  Created by mcivik on 26/11/14.
//  Copyright (c) 2014 mcivik. All rights reserved.
//

#import "AMBannerCustomEvent.h"
#import <AmazonAd/AmazonAdOptions.h>
#import <AmazonAd/AmazonAdError.h>

@implementation AMBannerCustomEvent

- (void)requestAdWithSize:(CGSize)size customEventInfo:(NSDictionary *)info
{
    

    self.amazonAdView = [AmazonAdView amazonAdViewWithAdSize:(isPhone() ? CGSizeMake(320, 50) : CGSizeMake(768, 90))];
    
    // Set the adOptions.
    AmazonAdOptions *options = [AmazonAdOptions options];

#if DEBUG
   // options.isTestRequest = YES;
#endif
    

    
    self.amazonAdView.delegate = self;
    

    [self.amazonAdView loadAd:options];
    
}

- (UIViewController *)viewControllerForPresentingModalView {
    return [Utils topmostViewController];
}

// @optional
- (void)adViewWillExpand:(AmazonAdView *)view {
    NSLog(@"Will present modal view for an ad. Its time to pause other activities.");
    [self.delegate bannerCustomEventWillBeginAction:self];
}

// @optional
- (void)adViewDidCollapse:(AmazonAdView *)view {
    NSLog(@"Modal view has been dismissed, its time to resume the paused activities.");
}

// @optional
- (void)adViewDidLoad:(AmazonAdView *)view {
    NSLog(@"Successfully loaded an ad");
    
    //[app.bannerView addSubview:self.amazonAdView];
    [self.delegate bannerCustomEvent:self didLoadAd:self.amazonAdView];
    
}
// @optional
- (void)adViewDidFailToLoad:(AmazonAdView *)view withError:(AmazonAdError *)error {
    NSLog(@"Ad Failed to load. Error code %d: %@", error.errorCode, error.errorDescription);
    
    [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:nil];
    
}



@end
