//
//  AMBannerCustomEvent.h
//  mcivik
//
//  Created by mcivik on 26/11/14.
//  Copyright (c) 2014 mcivik. All rights reserved.
//

#import "MPBannerCustomEvent.h"
#import <AmazonAd/AmazonAdView.h>

@interface AMBannerCustomEvent : MPBannerCustomEvent <AmazonAdViewDelegate>

@property (nonatomic, strong) AmazonAdView *amazonAdView;

@end
