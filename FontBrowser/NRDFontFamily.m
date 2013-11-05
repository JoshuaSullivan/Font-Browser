//
//  NRDFontFamily.m
//  FontBrowser
//
//  Created by Joshua Sullivan on 11/5/13.
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import "NRDFontFamily.h"

@implementation NRDFontFamily

- (instancetype)initWithFamilyName:(NSString *)familyName
{
    self = [super init];
    if (self) {
        self.familyName = familyName;
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        self.fontNames = [fontNames sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [(NSString *)obj1 compare:(NSString *)obj2];
        }];
    }
    return self;
}

@end
