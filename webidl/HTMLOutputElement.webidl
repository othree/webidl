/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * http://www.whatwg.org/specs/web-apps/current-work/#the-output-element
 *
 * © Copyright 2004-2011 Apple Computer, Inc., Mozilla Foundation, and
 * Opera Software ASA. You are granted a license to use, reproduce
 * and create derivative works of this document.
 */

// http://www.whatwg.org/specs/web-apps/current-work/#the-output-element
[HTMLConstructor]
interface HTMLOutputElement : HTMLElement {
  [PutForwards=value, Constant]
  readonly attribute DOMTokenList htmlFor;
  readonly attribute HTMLFormElement? form;
  [SetterThrows, Pure]
           attribute DOMString name;

  [Constant]
  readonly attribute DOMString type;
  [SetterThrows, Pure]
           attribute DOMString defaultValue;
  [SetterThrows, Pure]
           attribute DOMString value;

  readonly attribute boolean willValidate;
  readonly attribute ValidityState validity;
  readonly attribute DOMString validationMessage;
  boolean checkValidity();
  boolean reportValidity();
  void setCustomValidity(DOMString error);

// Not yet implemented (bug 556743).
//  readonly attribute NodeList labels;
};
