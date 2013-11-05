//
//  NRDFontFamily.h
//  FontBrowser
//
//  Created by Joshua Sullivan on 11/5/13.
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NRDFontFamily : NSObject

@property (strong, nonatomic) NSString *familyName;
@property (strong, nonatomic) NSArray *fontNames;

- (instancetype)initWithFamilyName:(NSString *)familyName;

@end
