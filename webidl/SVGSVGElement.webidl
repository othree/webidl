/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * http://www.w3.org/TR/SVG2/
 *
 * Copyright © 2012 W3C® (MIT, ERCIM, Keio), All Rights Reserved. W3C
 * liability, trademark and document use rules apply.
 */

interface SVGViewSpec;

interface SVGSVGElement : SVGGraphicsElement {

  [Constant]
  readonly attribute SVGAnimatedLength x;
  [Constant]
  readonly attribute SVGAnimatedLength y;
  [Constant]
  readonly attribute SVGAnimatedLength width;
  [Constant]
  readonly attribute SVGAnimatedLength height;
  // readonly attribute SVGRect viewport;
  [Constant]
  readonly attribute float pixelUnitToMillimeterX;
  [Constant]
  readonly attribute float pixelUnitToMillimeterY;
  [Constant]
  readonly attribute float screenPixelToMillimeterX;
  [Constant]
  readonly attribute float screenPixelToMillimeterY;
  readonly attribute boolean useCurrentView;
  // readonly attribute SVGViewSpec currentView;
           attribute float currentScale;
  readonly attribute SVGPoint currentTranslate;

  [DependsOn=Nothing, Affects=Nothing]
  unsigned long suspendRedraw(unsigned long maxWaitMilliseconds);
  [DependsOn=Nothing, Affects=Nothing]
  void unsuspendRedraw(unsigned long suspendHandleID);
  [DependsOn=Nothing, Affects=Nothing]
  void unsuspendRedrawAll();
  [DependsOn=Nothing, Affects=Nothing]
  void forceRedraw();
  void pauseAnimations();
  void unpauseAnimations();
  boolean animationsPaused();
  float getCurrentTime();
  void setCurrentTime(float seconds);
  // NodeList getIntersectionList(SVGRect rect, SVGElement referenceElement);
  // NodeList getEnclosureList(SVGRect rect, SVGElement referenceElement);
  // boolean checkIntersection(SVGElement element, SVGRect rect);
  // boolean checkEnclosure(SVGElement element, SVGRect rect);
  void deselectAll();
  [NewObject]
  SVGNumber createSVGNumber();
  [NewObject]
  SVGLength createSVGLength();
  [NewObject]
  SVGAngle createSVGAngle();
  [NewObject]
  SVGPoint createSVGPoint();
  [NewObject]
  SVGMatrix createSVGMatrix();
  [NewObject]
  SVGRect createSVGRect();
  [NewObject]
  SVGTransform createSVGTransform();
  [NewObject]
  SVGTransform createSVGTransformFromMatrix(SVGMatrix matrix);
  Element? getElementById(DOMString elementId);
};

SVGSVGElement implements SVGFitToViewBox;
SVGSVGElement implements SVGZoomAndPan;

