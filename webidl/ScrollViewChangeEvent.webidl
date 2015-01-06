/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 */

enum ScrollState {"started", "stopped"};

dictionary ScrollViewChangeEventInit : EventInit {
  ScrollState state = "started";
  float scrollX = 0;
  float scrollY = 0;
};

[Constructor(DOMString type, optional ScrollViewChangeEventInit eventInit),
 ChromeOnly]
interface ScrollViewChangeEvent : Event {
  readonly attribute ScrollState state;
  readonly attribute float scrollX;
  readonly attribute float scrollY;
};
