//
//  AMInterCustomEvent.h
//  mcivik
//
//  Created by mcivik on 26/11/14.
//  Copyright (c) 2014 mcivik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AmazonAd/AmazonAdOptions.h>
#import <AmazonAd/AmazonAdError.h>
#import <AmazonAd/AmazonAdInterstitial.h>

#import "MPInterstitialCustomEvent.h"

@interface AMInterCustomEvent : MPInterstitialCustomEvent <AmazonAdInterstitialDelegate>

@property (nonatomic, strong) AmazonAdInterstitial *amazonAdView;

@end
