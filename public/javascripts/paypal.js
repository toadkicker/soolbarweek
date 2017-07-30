(function ($, paypal, btnEl) {
  paypal.Button.render({

    env: 'production', // Or 'sandbox',

    commit: true, // Show a 'Pay Now' button

    payment: function() {
      // Set up the payment here
    },

    onAuthorize: function(data, actions) {
      // Execute the payment here
    }

  }, btnEl);
})(jQuery, payapl);