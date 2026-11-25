  // ==UserScript==
  // @name         Visma Federation ADFS quick SSO
  // @namespace    https://federation.visma.com/
  // @version      0.3.0
  // @description  For Visma's AWS login
  // @match        https://federation.visma.com/adfs/ls/IdpInitiatedSignOn.aspx*
  // @run-at       document-idle
  // ==/UserScript==

  (function () {
    'use strict';

    const EMAIL = 'a39080_cpa@visma.com';

    function byLabelText(labelText) {
      const labels = Array.from(document.querySelectorAll('label'));
      return labels.find(l => l.textContent.trim() === labelText);
    }

    function setNativeValue(el, value) {
      const setter = Object.getOwnPropertyDescriptor(el.__proto__, 'value')?.set;
      if (setter) setter.call(el, value);
      else el.value = value;
      el.dispatchEvent(new Event('input', { bubbles: true }));
      el.dispatchEvent(new Event('change', { bubbles: true }));
    }

    function selectIdPAndSubmit() {
      const label = byLabelText('Sign in to one of the following sites:');
      const radio = label && document.getElementById(label.getAttribute('for'));
      if (radio && !radio.checked) radio.click();

      const select = document.querySelector('select');
      if (select) {
        const option = Array.from(select.options).find(o => o.textContent.trim() === 'Amazon Web Services');
        if (option) {
          select.value = option.value;
          select.dispatchEvent(new Event('change', { bubbles: true }));
        }
      }

      const signInBtn = Array.from(document.querySelectorAll('input[type="submit"], button'))
        .find(el => el.value === 'Sign in' || el.textContent.trim() === 'Sign in');
      if (signInBtn) signInBtn.click();
    }

    function fillEmailAndTriggerAutofill() {
      const user = document.querySelector('#userNameInput, input[name="UserName"], input[type="email"]');
      const pass = document.querySelector('#passwordInput, input[name="Password"], input[type="password"]');

      if (user) {
        setNativeValue(user, EMAIL);
        user.focus();
        user.dispatchEvent(new KeyboardEvent('keydown', { key: 'ArrowDown', bubbles: true }));
      }

      if (pass) {
        // Focus password to encourage browser autofill
        setTimeout(() => pass.focus(), 150);
      }
    }

    if (document.querySelector('select')) {
      selectIdPAndSubmit();
    } else {
      fillEmailAndTriggerAutofill();
    }
  })();
